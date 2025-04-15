import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_weight_helper.dart';

class CustomButton extends StatelessWidget {
  final int currentIndex;
  final PageController controller;

  const CustomButton({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentIndex == 1) {
          context.pushNamed(Routes.loginView);
        } else {
          controller.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        margin: EdgeInsets.symmetric(horizontal: 26.r, vertical: 38.r),
        decoration: ShapeDecoration(
          color: AppColors.kMainAppColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
        child: Center(
          child: Text(
            currentIndex == 1 ? 'Get Started' : 'Next',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
