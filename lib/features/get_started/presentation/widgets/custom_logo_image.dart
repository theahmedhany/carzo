import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogoImage extends StatelessWidget {
  const CustomLogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/master/carzo_white_logo.png',
      width: 220.w,
      height: 220.h,
    );
  }
}
