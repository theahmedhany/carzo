import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomEditProfileButton extends StatelessWidget {
  const CustomEditProfileButton({
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
        decoration: ShapeDecoration(
          color: AppColors.kMainAppColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.font18WhiteRegular,
          ),
        ),
      ),
    );
  }
}
