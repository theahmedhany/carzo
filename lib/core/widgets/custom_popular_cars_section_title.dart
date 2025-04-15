import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_fonts.dart';

class CustomPopularCarsSectionTitle extends StatelessWidget {
  const CustomPopularCarsSectionTitle({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppFonts.font16DarkSemiBold.copyWith(height: 0)),
          CupertinoButton(
            onPressed: press,
            padding: EdgeInsets.zero,
            child: Text(
              'View All',
              style: AppFonts.font12GreyRegular.copyWith(height: 0),
            ),
          ),
        ],
      ),
    );
  }
}
