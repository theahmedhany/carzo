import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';
import 'custom_master_icon_circle.dart';

class CustomMasterAppBar extends StatelessWidget {
  const CustomMasterAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomMasterIconCircle(
                image: 'assets/icons/arrow-left.svg',
                press: () {
                  Navigator.pop(context);
                },
              ),
              Text(title, style: AppFonts.font18DarkBold),
              CustomMasterIconCircle(
                image: 'assets/icons/more.svg',
                press: () {},
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: AppColors.kMainGreyColor),
      ],
    );
  }
}
