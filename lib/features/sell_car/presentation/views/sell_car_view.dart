import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/popular_cars_section.dart';

class SellCarView extends StatelessWidget {
  const SellCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Sell Car'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(4),
                    const CustomSellCarCard(
                      title: 'Personal Car',
                      image: 'assets/images/personal_car.png',
                      navigate: Routes.sellPersonalCarView,
                    ),
                    const CustomSellCarCard(
                      title: 'New Car',
                      image: 'assets/images/sell-new-car.png',
                      navigate: Routes.sellNewCarsView,
                    ),
                    const CustomSellCarCard(
                      title: 'Used Car',
                      image: 'assets/images/sell-used-car.png',
                      navigate: Routes.sellUsedCarView,
                    ),
                    verticalSpace(150),
                    PopularCarsSection(),
                    verticalSpace(28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSellCarCard extends StatelessWidget {
  const CustomSellCarCard({
    super.key,
    required this.title,
    required this.image,
    required this.navigate,
  });

  final String title, image, navigate;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.pushNamed(context, navigate);
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
        margin: EdgeInsets.symmetric(horizontal: 18.r, vertical: 8.r),
        width: double.infinity,
        height: 110.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image, width: 190.w, height: 90.h, fit: BoxFit.contain),
            const Spacer(),
            Text(
              title.length > 12 ? '${title.substring(0, 12)}...' : title,
              maxLines: 1,
              style: AppFonts.font18DarkSemiBold.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
