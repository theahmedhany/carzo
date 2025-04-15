import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomHomeOurServicesSection extends StatelessWidget {
  const CustomHomeOurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.pushNamed(Routes.newCarsView);
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.r),
        width: double.infinity,
        height: 110.h,
        decoration: ShapeDecoration(
          color: AppColors.kSecondaryGreyColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New Cars', style: AppFonts.font18DarkBold),
              Image.asset('assets/images/new-cars-image.png', height: 70.h),
            ],
          ),
        ),
      ),
    );
  }
}
