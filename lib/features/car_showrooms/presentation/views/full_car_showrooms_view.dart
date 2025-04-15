import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_companies_shimmer_loading.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../../../../core/widgets/error_page.dart';
import '../../data/models/showrooms/showrooms_model.dart';
import '../../manager/showrooms/showrooms_cubit.dart';
import '../../manager/showrooms/showrooms_state.dart';
import '../widgets/custom_all_car_showrooms_card.dart';

class FullCarShowroomsView extends StatelessWidget {
  const FullCarShowroomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(child: CustomMasterAppBar(title: 'Car Showrooms')),
          Expanded(
            child: BlocBuilder<
              ShowroomsCubit,
              ShowroomsState<List<ShowroomsModel>>
            >(
              builder: (context, state) {
                return state.when(
                  idle:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  loading:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  success: (showrooms) {
                    return ListView.builder(
                      itemCount: showrooms.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 18.r),
                      itemBuilder: (context, index) {
                        return CustomAllCarShowroomsCard(
                          company: showrooms[index],
                          image: showrooms[index].pictureUrl ?? "",
                          title: showrooms[index].name ?? "Unknown",
                          navigate: Routes.carShowroomsDetailsView,
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
