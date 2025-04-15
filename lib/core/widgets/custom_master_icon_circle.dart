import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_colors.dart';

class CustomMasterIconCircle extends StatelessWidget {
  const CustomMasterIconCircle({
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
        width: 44.w,
        height: 44.h,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            width: 22.w,
            colorFilter: ColorFilter.mode(
              AppColors.kMainAppColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
