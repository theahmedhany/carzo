import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDots extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const CustomDots({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          height: 8.h,
          width: currentIndex == index ? 30.w : 8.w,
          margin: EdgeInsets.only(right: 5.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                currentIndex == index
                    ? const Color(0xff9CA3AF)
                    : const Color(0xffD7D7D7),
          ),
        ),
      ),
    );
  }
}
