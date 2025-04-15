import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/features/car_details/manager/car_details_cubit.dart';
import 'package:carzo/features/car_details/manager/car_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carzo/core/widgets/main_loading_indicator.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_car_details_car_images.dart';
import '../widgets/custom_car_details_section.dart';

class CarDetailsView extends StatelessWidget {
  final String carId;
  final String carStatus;

  const CarDetailsView({
    super.key,
    required this.carId,
    required this.carStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Car Details'),
            Expanded(
              child: BlocBuilder<CarDetailsCubit, CarDetailsState>(
                builder: (context, state) {
                  return state.when(
                    idle: () => const Center(child: MainLoadingIndicator()),
                    loading: () => const Center(child: MainLoadingIndicator()),
                    success:
                        (carDetails) => CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: CustomCarDetailsCarImages(
                                details: carDetails,
                              ),
                            ),
                            SliverToBoxAdapter(child: verticalSpace(8)),
                            SliverToBoxAdapter(
                              child: CustomCarDetailsSection(
                                details: carDetails,
                              ),
                            ),
                          ],
                        ),
                    error:
                        (errorMsg) =>
                            ErrorPage(error: 'Error: $errorMsg', space: 120),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
