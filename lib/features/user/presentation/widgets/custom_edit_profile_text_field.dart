import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class CustomEditProfileTextField extends StatelessWidget {
  const CustomEditProfileTextField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.kMainAppColor,
      style: TextStyle(color: AppColors.kMainAppColor, fontSize: 14.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 22.r, vertical: 16.r),
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          letterSpacing: -0.14,
          color: AppColors.kSecondaryTextColor,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.kMainGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.kMainGreyColor,
          ),
        ),
      ),
    );
  }
}
