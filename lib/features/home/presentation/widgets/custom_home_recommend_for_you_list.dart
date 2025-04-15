import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../recommend_for_you/data/models/all_cars_model.dart';
import '../../../recommend_for_you/manager/all_cars_cubit.dart';
import '../../../recommend_for_you/manager/all_cars_state.dart';
import 'custom_home_recommend_car_card.dart';
import 'custom_home_shimmer_error.dart';
import 'custom_home_shimmer_loading.dart';

class CustomHomeRecommendForYouList extends StatelessWidget {
  const CustomHomeRecommendForYouList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCarsCubit, AllCarsState<List<AllCarsModel>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: CustomHomeShimmerLoading()),
          loading: () => const Center(child: CustomHomeShimmerLoading()),
          success: (allCars) {
            if (allCars.isEmpty) {
              return Center(
                child: Text(
                  "No cars available",
                  style: TextStyle(color: AppColors.kSecondaryTextColor),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  allCars.take(2).map((car) {
                    return CustomHomeRecommendCarCard(
                      imageSrc: car.url?.first.url ?? "",
                      title: car.carName ?? "Unknown Car",
                      type: car.status ?? "Unknown",
                      location: car.dealershipName ?? "Unknown",
                      price: car.price?.toString() ?? "N/A",
                      itemId: car.carId.toString(),
                      press: () {
                        carDetailsStatus = car.status ?? "Unknown";
                        carDetailsId = car.carId.toString();
                        context.pushNamed(Routes.carDetailsView);
                      },
                    );
                  }).toList(),
            );
          },
          error: (errorMsg) {
            return CustomHomeShimmerError();
          },
        );
      },
    );
  }
}
