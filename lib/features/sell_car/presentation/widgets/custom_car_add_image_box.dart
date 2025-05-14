import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class CustomCarAddImageBox extends StatelessWidget {
  const CustomCarAddImageBox({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.5, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/add-photo.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.kMainAppColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
