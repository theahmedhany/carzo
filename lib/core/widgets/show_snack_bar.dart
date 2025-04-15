import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Ok',
        textColor: AppColors.kMainTextColor,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: Color(0xFFB9E5E8),
      content: Text(message, style: AppFonts.font12DarkMedium),
    ),
  );
}
