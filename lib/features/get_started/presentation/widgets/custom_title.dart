import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final int currentIndex;

  const CustomTitle({
    super.key,
    required this.title,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.r),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: currentIndex == 0 ? 46.sp : 36.sp,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
