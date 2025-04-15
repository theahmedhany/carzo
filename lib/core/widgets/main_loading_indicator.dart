import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

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
