import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Scaffold noInternetConnection() {
  return Scaffold(
    backgroundColor: AppColors.kMainBackgroundColor,
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/no_internet.svg',
              width: 280.w,
              height: 280.h,
            ),
            verticalSpace(20),
            Text(
              textAlign: TextAlign.center,
              "No Internet Connection",
              style: AppFonts.font22DarkSemiBold,
            ),
            verticalSpace(10),
            Text(
              "Please check your network settings and try again.",
              textAlign: TextAlign.center,
              style: AppFonts.font14GreyRegular,
            ),
          ],
        ),
      ),
    ),
  );
}
