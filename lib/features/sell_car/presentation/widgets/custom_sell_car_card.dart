import 'package:carzo/core/helpers/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

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
            horizontalSpace(4),
            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  maxLines: 1,
                  style: AppFonts.font18DarkSemiBold.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
