import 'package:flutter/cupertino.dart';

import '../../../../core/theming/app_fonts.dart';

class CustomHomePageSectionsTitle extends StatelessWidget {
  const CustomHomePageSectionsTitle({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppFonts.font16DarkSemiBold),
        CupertinoButton(
          onPressed: press,
          padding: EdgeInsets.zero,
          child: Text('View All', style: AppFonts.font14GreyRegular),
        ),
      ],
    );
  }
}
