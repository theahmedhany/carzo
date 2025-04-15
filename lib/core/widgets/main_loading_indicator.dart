import 'package:carzo/core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLoadingIndicator extends StatelessWidget {
  const MainLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.kMainTextColor,
        strokeWidth: 2,
      ),
    );
  }
}
