import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomHomeDrawerItem extends StatelessWidget {
  const CustomHomeDrawerItem({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: SvgPicture.asset(
        icon,
        width: 24.w,
        colorFilter: const ColorFilter.mode(
          AppColors.kMainTextColor,
          BlendMode.srcIn,
        ),
      ),
      title: Text(text, style: AppFonts.font18DarkRegular),
      trailing: SvgPicture.asset(
        'assets/icons/arrow-right.svg',
        width: 20.w,
        colorFilter: const ColorFilter.mode(
          AppColors.kMainTextColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
