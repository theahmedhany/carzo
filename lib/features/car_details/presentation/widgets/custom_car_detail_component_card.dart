import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomCarDetailComponentCard extends StatelessWidget {
  const CustomCarDetailComponentCard({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
  });

  final String icon, name, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.kMainBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.r,
          right: 12.r,
          top: 4.r,
          bottom: 4.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 34.w,
              height: 34.h,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: 18.w,
                  height: 18.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.kMainAppColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            verticalSpace(6),
            Text(
              name,
              maxLines: 2,
              style: AppFonts.font11GreyBold.copyWith(
                height: 0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(6),
            Text(
              value,
              maxLines: 1,
              style: AppFonts.font11DarkBold.copyWith(
                height: 0.7,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(6),
          ],
        ),
      ),
    );
  }
}
