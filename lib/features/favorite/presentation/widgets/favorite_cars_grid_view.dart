import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/features/favorite/data/models/favorite_car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_favorite_car_card.dart';

class FavoriteCarsGridView extends StatelessWidget {
  final List<FavoriteCarModel> favoriteCars;

  const FavoriteCarsGridView({super.key, required this.favoriteCars});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 12.r),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: MediaQuery.sizeOf(context).height * 0.28,
      ),
      itemCount: favoriteCars.length,
      itemBuilder: (_, index) {
        final car = favoriteCars[index];
        return CustomFavoriteCarCard(
          imageSrc: car.url?.isNotEmpty == true ? car.url!.first.url ?? '' : '',
          title: car.carName ?? 'Unknown',
          type: car.condition ?? 'Unknown',
          location: car.dealershipName ?? 'Unknown',
          price: car.price?.toString() ?? 'N/A',
          itemId: car.carId?.toString() ?? '',
          press: () {
            carDetailsStatus = car.condition ?? "Unknown";
            carDetailsId = car.carId.toString();
            context.pushNamed(Routes.carDetailsView);
          },
        );
      },
    );
  }
}
