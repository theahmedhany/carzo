import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

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
