import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

class CustomUsedCarCard extends StatelessWidget {
  const CustomUsedCarCard({
    super.key,
    required this.title,
    required this.image,
    required this.rate,
    required this.location,
    required this.price,
    required this.press,
    required this.itemId,
    required this.type,
  });

  final String title, image, rate, location, price, type;
  final VoidCallback press;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.r, vertical: 6.r),
        width: double.infinity,
        height: 110.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 14.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kSecondaryGreyColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: 155.w,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) {
                      return Center(child: CustomProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Image.asset(
                          'assets/master/carzo_logo.png',
                          width: 100.w,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title.length > 10
                          ? '${title.substring(0, 10)}...'
                          : title,
                      maxLines: 1,
                      style: AppFonts.font14DarkSemiBold.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xff767676),
                            BlendMode.srcIn,
                          ),
                          width: 18.w,
                        ),
                        horizontalSpace(8),
                        Text(
                          rate,
                          maxLines: 1,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xff767676),
                            BlendMode.srcIn,
                          ),
                          width: 18.w,
                        ),
                        horizontalSpace(8),
                        Text(
                          location.length > 10
                              ? '${location.substring(0, 10)}...'
                              : location,
                          maxLines: 1,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/money.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xff767676),
                            BlendMode.srcIn,
                          ),
                          width: 18.w,
                        ),
                        horizontalSpace(8),
                        Text(
                          price.length > 10
                              ? '${price.substring(0, 10)}...'
                              : price,
                          maxLines: 1,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomFavoriteButton(
                itemId: itemId,
                name: title,
                condition: type,
                dealershipName: location,
                price: int.tryParse(price) ?? 0,
                imageUrl: image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
