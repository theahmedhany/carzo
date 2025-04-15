import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/features/search/data/models/search_cars_model.dart';
import 'package:carzo/features/search/presentation/widgets/custom_search_car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchGridView extends StatelessWidget {
  const CustomSearchGridView({
    super.key,
    required this.context,
    required this.searchedCars,
  });

  final BuildContext context;
  final List<SearchCarsModel> searchedCars;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),

      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.28,
        ),

        delegate: SliverChildBuilderDelegate((context, index) {
          return CustomSearchCarCard(
            imageSrc: searchedCars[index].url?.first.url ?? '',
            title: searchedCars[index].carName ?? "Unknown",
            itemId: searchedCars[index].carId.toString(),
            type: searchedCars[index].status ?? "Unknown",
            location: searchedCars[index].dealershipName ?? "Unknown",
            price: searchedCars[index].price?.toString() ?? 'N/A',
            press: () {
              carDetailsStatus = searchedCars[index].status ?? "Unknown";
              carDetailsId = searchedCars[index].carId.toString();
              context.pushNamed(Routes.carDetailsView);
            },
          );
        }, childCount: searchedCars.length),
      ),
    );
  }
}
