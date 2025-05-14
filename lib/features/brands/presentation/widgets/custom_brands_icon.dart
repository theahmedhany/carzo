import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomBrandsIcon extends StatelessWidget {
  const CustomBrandsIcon({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.press,
  });

  final String title, imageSrc;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kMainAppColor,
            ),
            child: Center(child: Image.asset(imageSrc, height: 30.h)),
          ),

          verticalSpace(8),
          Text(
            title,
            style: AppFonts.font14DarkSemiBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
