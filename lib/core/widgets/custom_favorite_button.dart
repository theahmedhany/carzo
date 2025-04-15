import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/favorite/data/models/favorite_car_model.dart';
import '../../features/favorite/manager/favorite_cubit.dart';
import '../theming/app_colors.dart';

class CustomFavoriteButton extends StatelessWidget {
  final String itemId;
  final String name;
  final String condition;
  final String dealershipName;
  final int price;
  final String imageUrl;

  const CustomFavoriteButton({
    super.key,
    required this.itemId,
    required this.name,
    required this.condition,
    required this.dealershipName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<FavoriteCarModel>>(
      builder: (context, favoriteItems) {
        final isFavorite = favoriteItems.any(
          (favCar) => favCar.carId.toString() == itemId,
        );

        return GestureDetector(
          onTap: () {
            final car = FavoriteCarModel(
              carId: int.tryParse(itemId),
              carName: name,
              condition: condition,
              dealershipName: dealershipName,
              price: price,
              url: [Url(url: imageUrl)],
            );
            context.read<FavoriteCubit>().toggleFavorite(car);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isFavorite ? Colors.red : AppColors.kMainGreyColor,
                width: 1.5,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                isFavorite
                    ? 'assets/icons/solid-heart.svg'
                    : 'assets/icons/heart.svg',
                width: 15,
                height: 15,
                colorFilter: ColorFilter.mode(
                  isFavorite ? Colors.red : const Color(0xff767676),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
