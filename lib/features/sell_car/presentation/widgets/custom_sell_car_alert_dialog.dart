import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomSellCarAlertDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final Color dialogColor;
  final IconData dialogIcon;
  final VoidCallback press;

  const CustomSellCarAlertDialog({
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
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10.r),
              child: Icon(dialogIcon, color: Colors.white, size: 40.r),
            ),
            verticalSpace(10),
            Text(
              dialogHeader,
              style: AppFonts.font18DarkBold.copyWith(color: Colors.white),
            ),
            verticalSpace(14),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  dialogBody,
                  textAlign: TextAlign.start,
                  style: AppFonts.font15DarkMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            verticalSpace(20),
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
                  style: AppFonts.font15DarkMedium.copyWith(color: dialogColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
