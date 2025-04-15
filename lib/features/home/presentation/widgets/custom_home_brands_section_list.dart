import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:flutter/material.dart';

import 'custom_home_brands_section_icon.dart';

class CustomHomeBrandsSectionList extends StatelessWidget {
  const CustomHomeBrandsSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomHomeBrandsSectionIcon(
          title: 'BMW',
          imageSrc: 'assets/images/Brands/BMW.png',
          press: () {
            masterBrandName = 'BMW';
            context.pushNamed(Routes.brandsCarsView);
          },
        ),
        CustomHomeBrandsSectionIcon(
          title: 'Mercedes',
          imageSrc: 'assets/images/Brands/Mercedes-Benz.png',
          press: () {
            masterBrandName = 'Mercedes-Benz';
            context.pushNamed(Routes.brandsCarsView);
          },
        ),
        CustomHomeBrandsSectionIcon(
          title: 'Audi',
          imageSrc: 'assets/images/Brands/Audi.png',
          press: () {
            masterBrandName = 'Audi';
            context.pushNamed(Routes.brandsCarsView);
          },
        ),
        CustomHomeBrandsSectionIcon(
          title: 'Kia',
          imageSrc: 'assets/images/Brands/Kia.png',
          press: () {
            masterBrandName = 'Kia';
            context.pushNamed(Routes.brandsCarsView);
          },
        ),
      ],
    );
  }
}
