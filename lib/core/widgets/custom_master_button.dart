import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

class CustomMasterButton extends StatelessWidget {
  const CustomMasterButton({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        margin: EdgeInsets.only(
          left: 12.r,
          right: 12.r,
          top: 40.r,
          bottom: 18.r,
        ),
        decoration: ShapeDecoration(
          color: AppColors.kMainAppColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.font16WhiteRegular,
          ),
        ),
      ),
    );
  }
}
