import 'package:carzo/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCompaniesShimmerLoading extends StatelessWidget {
  const CustomCompaniesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 8.r, bottom: 18.r),
      itemBuilder: (context, index) {
        return Container(
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
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  width: 90.r,
                  height: 90.r,
                  decoration: ShapeDecoration(
                    color: Colors.grey[300],
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.grey[300]!, width: 5.w),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  width: 130.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
