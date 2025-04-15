import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomContactInformationCard extends StatelessWidget {
  const CustomContactInformationCard({
    super.key,
    required this.press,
    required this.icon,
    required this.title,
  });

  final VoidCallback press;
  final String icon, title;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        width: 250.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25.w,
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  AppColors.kMainAppColor,
                  BlendMode.srcIn,
                ),
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
