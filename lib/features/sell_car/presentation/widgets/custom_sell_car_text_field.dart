import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class CustomSellCarTextField extends StatelessWidget {
  const CustomSellCarTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.controller,
    required this.validator,
    required this.keyboardType,
  });

  final String title, hint, icon;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.kMainAppColor.withValues(alpha: 0.8),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              height: 0.5,
              letterSpacing: 1.89,
            ),
          ),
        ),

        verticalSpace(6),
        TextFormField(
          controller: controller,
          validator: (value) => validator(value),
          keyboardType: keyboardType,
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
              borderSide: BorderSide(width: 1.5.w),
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
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}
