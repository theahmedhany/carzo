import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class CustomCarDetailsImageDots extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const CustomCarDetailsImageDots({
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
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          height: 8.h,
          width: currentIndex == index ? 30.w : 10.w,
          margin: EdgeInsets.only(right: 8.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                currentIndex == index
                    ? AppColors.kMainAppColor
                    : const Color(0xffD7D7D7),
          ),
        ),
      ),
    );
  }
}
