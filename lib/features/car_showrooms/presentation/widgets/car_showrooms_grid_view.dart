import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_grid_view_loading.dart';
import '../../../../core/widgets/error_page.dart';
import '../../data/models/showroom_cars/showroom_cars_model.dart';
import '../../manager/showroom_cars/showroom_cars_cubit.dart';
import '../../manager/showroom_cars/showroom_cars_state.dart';
import 'car_showrooms_car_card.dart';

class CarShowroomsGridView extends StatelessWidget {
  const CarShowroomsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ShowroomCarsCubit,
      ShowroomCarsState<List<ShowroomCarsModel>>
    >(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: CustomGridViewLoading()),
          loading: () => const Center(child: CustomGridViewLoading()),
          success: (cars) {
            if (cars.isEmpty) {
              return const Center(child: Text('No cars available'));
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 18.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.28,
              ),
              itemCount: cars.length,
              itemBuilder: (_, index) {
                return CarShowroomsCarCard(
                  imageSrc: cars[index].url!.first.url ?? '',
                  title:
                      (cars[index].carName ?? "Unknown Car").length > 18
                          ? '${cars[index].carName?.substring(0, 18) ?? "Unknown Car"}...'
                          : cars[index].carName ?? "Unknown Car",
                  type: cars[index].status ?? 'N/A',
                  location:
                      (cars[index].dealershipName ?? "Unknown").length > 18
                          ? '${cars[index].dealershipName?.substring(0, 18) ?? "Unknown"}...'
                          : cars[index].dealershipName ?? "Unknown",
                  price: cars[index].price?.toString() ?? 'N/A',
                  itemId: cars[index].carId.toString(),
                  press: () {
                    carDetailsStatus = cars[index].status ?? "Unknown";
                    carDetailsId = cars[index].carId.toString();
                    context.pushNamed(Routes.carDetailsView);
                  },
                );
              },
            );
          },
          error: (errorMsg) => ErrorPage(error: 'Error: $errorMsg', space: 50),
        );
      },
    );
  }
}
