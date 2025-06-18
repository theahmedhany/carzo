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

class CustomSearchCarCard extends StatelessWidget {
  const CustomSearchCarCard({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.type,
    required this.location,
    required this.price,
    required this.press,
    required this.itemId,
  });

  final String imageSrc, title, type, location, price;
  final VoidCallback press;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        width: 160.w,
        height: 230.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.kMainGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.kSecondaryGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageSrc,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) {
                          return const Center(child: CustomProgressIndicator());
                        },
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Image.asset(
                              'assets/master/carzo_logo.png',
                              width: 100.w,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.r,
                    right: 5.r,
                    child: CustomFavoriteButton(
                      itemId: itemId,
                      name: title,
                      condition: type,
                      dealershipName: location,
                      price: int.tryParse(price) ?? 0,
                      imageUrl: imageSrc,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title.length > 20
                            ? '${title.substring(0, 20)}...'
                            : title,
                        maxLines: 1,
                        style: AppFonts.font14DarkSemiBold.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/car_status.svg',
                            colorFilter: const ColorFilter.mode(
                              Color(0xff767676),
                              BlendMode.srcIn,
                            ),
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          Text(
                            type,
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
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          Text(
                            location.length > 20
                                ? '${location.substring(0, 20)}...'
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
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          Text(
                            price.length > 20
                                ? '${price.substring(0, 20)}...'
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
