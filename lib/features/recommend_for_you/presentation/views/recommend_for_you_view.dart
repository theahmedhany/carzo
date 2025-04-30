import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_list_view_loading.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../../../../core/widgets/error_page.dart';
import '../../data/models/all_cars_model.dart';
import '../../manager/all_cars_cubit.dart';
import '../../manager/all_cars_state.dart';
import '../widgets/custom_recommend_for_you_card.dart';

class RecommendForYouView extends StatelessWidget {
  const RecommendForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: CustomMasterAppBar(title: 'Recommend For You'),
          ),
          Expanded(
            child: BlocBuilder<AllCarsCubit, AllCarsState<List<AllCarsModel>>>(
              builder: (context, state) {
                return state.when(
                  idle: () => const Center(child: CustomListViewLoading()),
                  loading: () => const Center(child: CustomListViewLoading()),
                  success: (allCars) {
                    return ListView.builder(
                      itemCount: allCars.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 28.r),
                      itemBuilder: (context, index) {
                        return CustomRecommendForYouCard(
                          image: allCars[index].url!.first.url ?? "",
                          title: allCars[index].carName ?? "Unknown Car",
                          type: allCars[index].status ?? "Unknown",
                          location: allCars[index].dealershipName ?? "Unknown",
                          price: allCars[index].price?.toString() ?? "N/A",
                          itemId: allCars[index].carId.toString(),

                          press: () {
                            carDetailsStatus =
                                allCars[index].status ?? "Unknown";
                            carDetailsId = allCars[index].carId.toString();
                            context.pushNamed(Routes.carDetailsView);
                          },
                        );
                      },
                    );
                  },
                  error: (errorMsg) {
                    return ErrorPage(error: 'Error: $errorMsg');
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
