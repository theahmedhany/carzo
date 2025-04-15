import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_weight_helper.dart';

class CustomDescription extends StatelessWidget {
  final String description;

  const CustomDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.r),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          description,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
