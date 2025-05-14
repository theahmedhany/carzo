import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomCompanyDetailsDataBox extends StatelessWidget {
  const CustomCompanyDetailsDataBox({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 10.r),
        margin: EdgeInsets.symmetric(horizontal: 32.r),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.5, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              width: 26.w,
              height: 26.h,
              icon,
              colorFilter: const ColorFilter.mode(
                AppColors.kMainTextColor,
                BlendMode.srcIn,
              ),
            ),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.right,
              style: AppFonts.font22DarkSemiBold,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
