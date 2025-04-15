import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/widgets/custom_companies_shimmer_loading.dart';
import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/features/maintenance_companies/data/models/maintenance_companies_model.dart';
import 'package:carzo/features/maintenance_companies/manager/maintenance_companies_cubit.dart';
import 'package:carzo/features/maintenance_companies/manager/maintenance_companies_state.dart';
import 'package:carzo/features/maintenance_companies/presentation/widgets/maintenance_companies_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';

class MaintenanceCompaniesView extends StatelessWidget {
  const MaintenanceCompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            child: CustomMasterAppBar(title: 'Maintenance Companies'),
          ),
          Expanded(
            child: BlocBuilder<
              MaintenanceCompaniesCubit,
              MaintenanceCompaniesState<List<MaintenanceCompaniesModel>>
            >(
              builder: (context, state) {
                return state.when(
                  idle:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  loading:
                      () =>
                          const Center(child: CustomCompaniesShimmerLoading()),
                  success: (maintenanceCompanies) {
                    return ListView.builder(
                      itemCount: maintenanceCompanies.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 18.r),
                      itemBuilder: (context, index) {
                        return MaintenanceCompaniesCard(
                          image: maintenanceCompanies[index].pictureUrl ?? "",
                          title:
                              maintenanceCompanies[index].name ??
                              "Unknown Company",
                          navigate: Routes.maintenanceCompaniesDetailsView,
                          company: maintenanceCompanies[index],
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
