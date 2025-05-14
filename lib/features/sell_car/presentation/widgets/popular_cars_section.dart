import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_popular_cars_section_title.dart';
import '../../../recommend_for_you/data/models/all_cars_model.dart';
import '../../../recommend_for_you/manager/all_cars_cubit.dart';
import '../../../recommend_for_you/manager/all_cars_state.dart';
import 'custom_popular_car_card.dart';
import 'custom_sell_car_recommended_error.dart';
import 'custom_sell_car_recommended_shimmer_loading.dart';

class PopularCarsSection extends StatelessWidget {
  const PopularCarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPopularCarsSectionTitle(
          title: 'Recommended For You',
          press: () {
            Navigator.pushNamed(context, Routes.recommendForYouView);
          },
        ),
        SizedBox(
          height: 110.h,
          child: BlocBuilder<AllCarsCubit, AllCarsState<List<AllCarsModel>>>(
            builder: (context, state) {
              return state.when(
                idle:
                    () => const Center(
                      child: CustomSellCarRecommendedShimmerLoading(),
                    ),
                loading:
                    () => const Center(
                      child: CustomSellCarRecommendedShimmerLoading(),
                    ),
                success: (allCars) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 18.r : 0),
                        child: CustomPopularCarCard(
                          title: allCars[index].carName ?? "Unknown Car",
                          image: allCars[index].url!.first.url ?? "",
                          type: allCars[index].status ?? "Unknown",
                          price: allCars[index].price?.toString() ?? "N/A",
                          itemId: allCars[index].carId.toString(),
                          location: allCars[index].dealershipName ?? "Unknown",
                          press: () {
                            carDetailsStatus =
                                allCars[index].status ?? "Unknown";
                            carDetailsId = allCars[index].carId.toString();
                            context.pushNamed(Routes.carDetailsView);
                          },
                        ),
                      );
                    },
                  );
                },
                error: (errorMsg) {
                  return const CustomSellCarRecommendedError();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
