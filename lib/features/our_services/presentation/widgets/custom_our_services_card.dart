import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomOurServicesCard extends StatelessWidget {
  const CustomOurServicesCard({
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
        context.pushNamed(navigate);
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.only(left: 8.r),
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
        child: Padding(
          padding: EdgeInsets.only(left: 10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title, style: AppFonts.font18DarkBold),
              Image.asset(
                image,
                width: 200.w,
                height: 70.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
