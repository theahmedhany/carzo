import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/widgets/custom_grid_view_loading.dart';
import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/core/widgets/no_cars_available.dart';
import 'package:carzo/features/brands/manager/brand_cars_state.dart';
import 'package:carzo/features/brands/presentation/widgets/custom_brands_car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carzo/features/brands/manager/brand_cars_cubit.dart';

class BrandsCarsGridView extends StatelessWidget {
  const BrandsCarsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCarsCubit, BrandCarsState>(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: CustomGridViewLoading()),
          loading: () => const Center(child: CustomGridViewLoading()),
          success: (brandCars) {
            if (brandCars.isEmpty) {
              return Column(children: [verticalSpace(150), NoCarsAvailable()]);
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
              itemCount: brandCars.length,
              itemBuilder: (_, index) {
                final car = brandCars[index];
                return CustomBrandsCarCard(
                  imageSrc: car.url?.isNotEmpty == true ? car.url![0].url! : '',
                  title: car.carName ?? 'Unknown',
                  type: car.status ?? 'N/A',
                  location: car.dealershipName ?? 'Unknown',
                  price: '\$${car.price ?? 'N/A'}',
                  itemId: car.carId.toString(),
                  press: () {
                    carDetailsStatus = car.status ?? "Unknown";
                    carDetailsId = car.carId.toString();
                    context.pushNamed(Routes.carDetailsView);
                  },
                );
              },
            );
          },
          error: (errorMsg) {
            return ErrorPage(error: 'Error: $errorMsg', space: 130);
          },
        );
      },
    );
  }
}
