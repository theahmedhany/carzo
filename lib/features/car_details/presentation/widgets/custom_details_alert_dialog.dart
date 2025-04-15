import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomDetailsAlertDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final String dialogIcon;
  final VoidCallback press;
  final Color dialogColor;

  const CustomDetailsAlertDialog({
    super.key,
    required this.dialogIcon,
    required this.dialogHeader,
    required this.dialogBody,
    required this.press,
    required this.dialogColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: dialogColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.kMainAppColor.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(12.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(10.r),
                child: Center(
                  child: SvgPicture.asset(
                    width: 26.w,
                    height: 26.h,
                    dialogIcon,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(10),
            Text(
              dialogHeader,
              style: AppFonts.font18DarkBold.copyWith(
                color: AppColors.kMainAppColor,
              ),
            ),
            verticalSpace(16),
            SelectableText(
              dialogBody,
              textAlign: TextAlign.center,
              style: AppFonts.font15DarkMedium.copyWith(
                color: AppColors.kMainAppColor,
              ),
            ),
            verticalSpace(32),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(vertical: 12.r),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppFonts.font15DarkMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: TextButton(
                    onPressed: press,
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.kMainAppColor,
                      padding: EdgeInsets.symmetric(vertical: 12.r),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Open',
                      style: AppFonts.font15DarkMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
