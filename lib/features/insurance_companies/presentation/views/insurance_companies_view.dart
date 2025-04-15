import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/widgets/custom_companies_shimmer_loading.dart';
import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/features/insurance_companies/data/models/insurance_companies_model.dart';
import 'package:carzo/features/insurance_companies/manager/insurance_companies_cubit.dart';
import 'package:carzo/features/insurance_companies/manager/insurance_companies_state.dart';
import 'package:carzo/features/insurance_companies/presentation/widgets/insurance_companies_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';

class InsuranceCompaniesView extends StatelessWidget {
  const InsuranceCompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            child: CustomMasterAppBar(title: 'Insurance Companies'),
          ),
          Expanded(
            child: BlocBuilder<
              InsuranceCompaniesCubit,
              InsuranceCompaniesState<List<InsuranceCompaniesModel>>
            >(
              builder: (context, state) {
                return state.when(
                  idle:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  loading:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  success: (insuranceCompanies) {
                    return ListView.builder(
                      itemCount: insuranceCompanies.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 18.r),
                      itemBuilder: (context, index) {
                        return InsuranceCompaniesCard(
                          company: insuranceCompanies[index],
                          image: insuranceCompanies[index].pictureUrl ?? "",
                          title:
                              insuranceCompanies[index].name ??
                              "Unknown Company",
                          navigate: Routes.insuranceCompaniesDetailsView,
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
