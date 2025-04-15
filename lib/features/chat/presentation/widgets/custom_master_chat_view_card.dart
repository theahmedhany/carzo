import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomMasterChatViewCard extends StatelessWidget {
  const CustomMasterChatViewCard({
    super.key,
    required this.title,
    required this.image,
    required this.navigate,
  });

  final String title, image;
  final VoidCallback navigate;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: navigate,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.r),
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
            Image.asset(image, width: 85.w, height: 85.h, fit: BoxFit.contain),
            const Spacer(),
            Text(title, style: AppFonts.font18DarkSemiBold),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
