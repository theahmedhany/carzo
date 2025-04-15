import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class CustomUserListTileIconCircle extends StatelessWidget {
  const CustomUserListTileIconCircle({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(
          side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          width: 22.w,
          colorFilter: const ColorFilter.mode(
            AppColors.kSecondaryTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
