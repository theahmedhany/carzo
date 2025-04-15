import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_fonts.dart';

class NoCarsAvailable extends StatelessWidget {
  const NoCarsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_cars_available.png'),
          verticalSpace(32),
          Text('No Cars Available', style: AppFonts.font18DarkSemiBold),
          verticalSpace(16),
          Text(
            'Sorry, there are no cars currently available.\nPlease check back later.',
            textAlign: TextAlign.center,
            style: AppFonts.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}
