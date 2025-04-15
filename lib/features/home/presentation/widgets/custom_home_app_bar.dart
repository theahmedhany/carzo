import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.r),
            child: Row(
              children: [
                SizedBox(
                  height: 46.h,
                  child: Image.asset(
                    'assets/master/carzo_logo.png',
                    fit: BoxFit.contain,
                    width: 94.w,
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    context.pushNamed(Routes.notificationsView);
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.kMainAppColor,
                        ),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                        width: 22.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.kMainAppColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(8),
                CupertinoButton(
                  onPressed: () {
                    context.pushNamed(Routes.personalDetailsView);
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.kMainAppColor,
                        ),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 26.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.kMainAppColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: AppColors.kMainGreyColor),
        ],
      ),
    );
  }
}
