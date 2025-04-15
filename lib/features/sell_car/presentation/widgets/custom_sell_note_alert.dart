import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSellNoteAlert extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final Color dialogColor;
  final IconData dialogIcon;
  final VoidCallback press;

  const CustomSellNoteAlert({
    super.key,
    required this.dialogIcon,
    required this.dialogHeader,
    required this.dialogBody,
    required this.dialogColor,
    required this.press,
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
              padding: EdgeInsets.all(10.r),
              child: Icon(
                dialogIcon,
                color: AppColors.kMainTextColor,
                size: 40.r,
              ),
            ),
            verticalSpace(12),
            Text(
              dialogHeader,
              style: AppFonts.font18DarkBold.copyWith(
                color: AppColors.kMainAppColor,
              ),
            ),
            verticalSpace(16),
            Text(
              dialogBody,
              textAlign: TextAlign.center,
              style: AppFonts.font15DarkMedium.copyWith(
                color: AppColors.kMainAppColor,
              ),
            ),
            verticalSpace(32),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: press,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'OK',
                  style: AppFonts.font15DarkMedium.copyWith(
                    color: AppColors.kMainAppColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
