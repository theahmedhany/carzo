import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error, required this.space});

  final String error;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(space),
          Image.asset('assets/images/error_page.png'),
          verticalSpace(32),
          Text('An Error Occurred.', style: AppFonts.font18DarkSemiBold),
          verticalSpace(16),
          Text(
            'An error occurred while loading page.\nPlease try again later.',
            textAlign: TextAlign.center,
            style: AppFonts.font14GreyRegular,
          ),
          verticalSpace(12),
          Text(
            error,
            textAlign: TextAlign.center,
            style: AppFonts.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}
