import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/widgets/custom_companies_shimmer_loading.dart';
import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/features/rescue_companies/data/models/rescue_companies_model.dart';
import 'package:carzo/features/rescue_companies/manager/rescue_companies_cubit.dart';
import 'package:carzo/features/rescue_companies/manager/rescue_companies_state.dart';
import 'package:carzo/features/rescue_companies/presentation/widgets/rescue_companies_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';

class RescueCompaniesView extends StatelessWidget {
  const RescueCompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(child: CustomMasterAppBar(title: 'Rescue Companies')),
          Expanded(
            child: BlocBuilder<
              RescueCompaniesCubit,
              RescueCompaniesState<List<RescueCompaniesModel>>
            >(
              builder: (context, state) {
                return state.when(
                  idle:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  loading:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  success: (rescueCompanies) {
                    return ListView.builder(
                      itemCount: rescueCompanies.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 18.r),
                      itemBuilder: (context, index) {
                        return RescueCompaniesCard(
                          image: rescueCompanies[index].pictureUrl ?? "",
                          title:
                              rescueCompanies[index].name ?? "Unknown Company",
                          navigate: Routes.rescueCompaniesDetailsView,
                          company: rescueCompanies[index],
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
