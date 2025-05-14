import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class CustomLoadingTextField extends StatelessWidget {
  const CustomLoadingTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
    this.isEnabled = true,
    required this.validator,
    required this.keyboardType,
  });

  final String hint, icon;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType keyboardType;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      keyboardType: keyboardType,
      enabled: isEnabled,
      maxLines: 5,
      minLines: 1,
      style: TextStyle(
        color: AppColors.kMainAppColor.withValues(alpha: 0.8),
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 18.r, right: 12.r),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.kMainAppColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.kMainAppColor.withValues(alpha: 0.8),
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(width: 1.5.w, color: AppColors.kMainGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(width: 1.5.w, color: AppColors.kMainGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(width: 1.5.w, color: AppColors.kMainGreyColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
