import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/rescue_companies_model.dart';

class RescueCompaniesCard extends StatelessWidget {
  const RescueCompaniesCard({
    super.key,
    required this.title,
    required this.image,
    required this.navigate,
    required this.company,
  });

  final String title, image, navigate;
  final RescueCompaniesModel company;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.pushNamed(navigate, arguments: company);
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.r),
        margin: EdgeInsets.symmetric(horizontal: 18.r, vertical: 8.r),
        width: double.infinity,
        height: 110.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 90.r,
              height: 90.r,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(color: AppColors.kMainAppColor, width: 5.w),
                ),
              ),
              child: ClipOval(
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: 90.r,
                    height: 90.r,
                    fit: BoxFit.contain,
                    placeholder: (context, url) {
                      return const Center(child: CustomProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Image.asset(
                          'assets/master/carzo_logo.png',
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              title,
              maxLines: 1,
              style: AppFonts.font18DarkSemiBold.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
