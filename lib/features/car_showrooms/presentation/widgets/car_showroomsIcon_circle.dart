import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class CarShowroomsIconCircle extends StatelessWidget {
  const CarShowroomsIconCircle({
    super.key,
    required this.image,
    required this.press,
  });

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: ShapeDecoration(
          color: AppColors.kMainAppColor,
          shape: CircleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainAppColor),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            width: 20.w,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
