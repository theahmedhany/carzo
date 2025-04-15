import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'custom_home_bottom_navigation_bar_icon.dart';

class CustomHomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomHomeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentIndex == 0 ? Colors.white : AppColors.kMainBackgroundColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.r),
        margin: EdgeInsets.only(left: 12.r, right: 12.r, bottom: 12.r),
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.kMainAppColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomHomeBottomNavigationBarIcon(
              title: 'Home',
              icon: 'assets/icons/home.svg',
              selected: currentIndex == 0,
              press: () => onTap(0),
            ),
            CustomHomeBottomNavigationBarIcon(
              title: 'Search',
              icon: 'assets/icons/search-normal.svg',
              selected: currentIndex == 1,
              press: () => onTap(1),
            ),
            CustomHomeBottomNavigationBarIcon(
              title: 'Favorite',
              icon: 'assets/icons/heart.svg',
              selected: currentIndex == 2,
              press: () => onTap(2),
            ),
            CustomHomeBottomNavigationBarIcon(
              title: 'Chat',
              icon: 'assets/icons/message-text.svg',
              selected: currentIndex == 3,
              press: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
