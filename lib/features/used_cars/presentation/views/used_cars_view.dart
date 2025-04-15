import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/widgets/custom_list_view_loading.dart';
import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/features/used_cars/manager/used_cars_cubit.dart';
import 'package:carzo/features/used_cars/manager/used_cars_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_used_car_card.dart';
import '../../data/models/used_car_model.dart';

class UsedCarsView extends StatelessWidget {
  const UsedCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(child: CustomMasterAppBar(title: 'Used Cars')),
          Expanded(
            child: BlocBuilder<
              UsedCarsCubit,
              UsedCarsState<List<UsedCarModel>>
            >(
              builder: (context, state) {
                return state.when(
                  idle: () => const Center(child: CustomListViewLoading()),
                  loading: () => const Center(child: CustomListViewLoading()),
                  success: (usedCars) {
                    return ListView.builder(
                      itemCount: usedCars.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 28.r),
                      itemBuilder: (context, index) {
                        return CustomUsedCarCard(
                          image: usedCars[index].url!.first.url ?? "",
                          title: usedCars[index].carName ?? "Unknown Car",
                          rate: "N/A",
                          location: usedCars[index].dealershipName ?? "Unknown",
                          price: usedCars[index].price?.toString() ?? "N/A",
                          itemId: usedCars[index].carId.toString(),
                          type: usedCars[index].status ?? "Unknown",

                          press: () {
                            carDetailsStatus =
                                usedCars[index].status ?? "Unknown";
                            carDetailsId = usedCars[index].carId.toString();
                            context.pushNamed(Routes.carDetailsView);
                          },
                        );
                      },
                    );
                  },
                  error: (errorMsg) {
                    return ErrorPage(error: 'Error: $errorMsg', space: 120);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
