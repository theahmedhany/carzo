import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class CustomHomeShimmerLoading extends StatelessWidget {
  const CustomHomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomHomeShimmerLoadingCard(),
        CustomHomeShimmerLoadingCard(),
      ],
    );
  }
}

class CustomHomeShimmerLoadingCard extends StatelessWidget {
  const CustomHomeShimmerLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 220.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF0F0F0),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.kMainGreyColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.kSecondaryGreyColor,
                  highlightColor: AppColors.kMainGreyColor,
                  child: Container(
                    width: double.infinity,
                    height: 130.h,
                    decoration: BoxDecoration(
                      color: AppColors.kSecondaryGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.r,
                  right: 5.r,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: AppColors.kMainGreyColor,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/heart.svg',
                        width: 15,
                        height: 15,
                        colorFilter: ColorFilter.mode(
                          AppColors.kMainGreyColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
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
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 14.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
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
    );
  }
}
