import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import 'custom_user_list_tile_icon_circle.dart';

class CustomPersonalDetailsListTile extends StatelessWidget {
  const CustomPersonalDetailsListTile({
    super.key,
    required this.text,
    required this.image,
    required this.press,
  });

  final String text;
  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomUserListTileIconCircle(image: image),
      title: Text(text, style: AppFonts.font14DarkRegular),
      trailing: SvgPicture.asset(
        'assets/icons/arrow-right.svg',
        colorFilter: const ColorFilter.mode(
          AppColors.kSecondaryTextColor,
          BlendMode.srcIn,
        ),
      ),
      onTap: press,
    );
  }
}
