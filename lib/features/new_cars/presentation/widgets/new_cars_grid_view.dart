import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_grid_view_loading.dart';
import '../../../../core/widgets/error_page.dart';
import '../../data/models/new_car_model.dart';
import '../../manager/new_cars_cubit.dart';
import '../../manager/new_cars_state.dart';
import 'custom_new_car_card.dart';

class NewCarsGridView extends StatelessWidget {
  const NewCarsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewCarsCubit, NewCarsState<List<NewCarModel>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: CustomGridViewLoading()),
          loading: () => const Center(child: CustomGridViewLoading()),
          success: (newCars) {
            if (newCars.isEmpty) {
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
              itemCount: newCars.length,
              itemBuilder: (_, index) {
                return CustomNewCarCard(
                  imageSrc: newCars[index].url!.first.url ?? '',
                  title:
                      (newCars[index].carName ?? "Unknown Car").length > 18
                          ? '${newCars[index].carName?.substring(0, 18) ?? "Unknown Car"}...'
                          : newCars[index].carName ?? "Unknown Car",
                  rate: 'N/A',
                  location:
                      (newCars[index].dealershipName ?? "Unknown").length > 18
                          ? '${newCars[index].dealershipName?.substring(0, 18) ?? "Unknown"}...'
                          : newCars[index].dealershipName ?? "Unknown",
                  price: newCars[index].price?.toString() ?? 'N/A',
                  itemId: newCars[index].carId.toString(),
                  type: newCars[index].status ?? 'Unknown',
                  press: () {
                    carDetailsStatus = newCars[index].status ?? "Unknown";
                    carDetailsId = newCars[index].carId.toString();
                    context.pushNamed(Routes.carDetailsView);
                  },
                );
              },
            );
          },
          error: (errorMsg) => ErrorPage(error: 'Error: $errorMsg', space: 120),
        );
      },
    );
  }
}
