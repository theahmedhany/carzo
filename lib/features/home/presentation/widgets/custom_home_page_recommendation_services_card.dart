import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_fonts.dart';
import 'custom_home_our_services_section.dart';
import 'custom_home_page_sections_title.dart';
import 'custom_home_recommend_for_you_list.dart';

class CustomHomePageRecommendationServicesCard extends StatelessWidget {
  const CustomHomePageRecommendationServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          CustomHomePageSectionsTitle(
            title: 'Recommend For You',
            press: () {
              context.pushNamed(Routes.recommendForYouView);
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Available', style: AppFonts.font14GreyRegular),
          ),
          verticalSpace(14),
          const CustomHomeRecommendForYouList(),
          verticalSpace(20),
          CustomHomePageSectionsTitle(
            title: 'Our Services',
            press: () {
              context.pushNamed(Routes.ourServicesView);
            },
          ),
          verticalSpace(12),
          const CustomHomeOurServicesSection(),
        ],
      ),
    );
  }
}
