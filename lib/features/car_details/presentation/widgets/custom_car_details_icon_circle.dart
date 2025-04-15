import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';

class CustomCarDetailsIconCircle extends StatelessWidget {
  const CustomCarDetailsIconCircle({
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
        width: 40.w,
        height: 40.h,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            width: 20.w,
            colorFilter: const ColorFilter.mode(
              Color(0xff767676),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
