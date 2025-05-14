import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';

class CustomHomeBottomNavigationBarIcon extends StatelessWidget {
  const CustomHomeBottomNavigationBarIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.press,
  });

  final String title, icon;
  final bool selected;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color:
                  selected
                      ? const Color(0xffB9E5E8).withValues(alpha: 0.4)
                      : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  selected ? const Color(0xffB9E5E8) : Colors.white,
                  BlendMode.srcIn,
                ),
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          verticalSpace(4),
          Text(
            title,
            style: TextStyle(
              color: selected ? const Color(0xffB9E5E8) : Colors.white,
              fontSize: 12.sp,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
