import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import 'custom_home_brands_section_list.dart';
import 'custom_home_page_sections_title.dart';

class CustomHomeBrandsSection extends StatelessWidget {
  const CustomHomeBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          CustomHomePageSectionsTitle(
            title: 'Brands',
            press: () {
              context.pushNamed(Routes.brandsView);
            },
          ),
          verticalSpace(14),
          const CustomHomeBrandsSectionList(),
          verticalSpace(20),
        ],
      ),
    );
  }
}
