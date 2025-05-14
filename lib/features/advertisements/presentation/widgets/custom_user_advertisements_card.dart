import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../manager/user_advertisements_cubit.dart';

class CustomUserAdvertisementsCard extends StatelessWidget {
  const CustomUserAdvertisementsCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.press,
    required this.advertisementId,
  });

  final String title, image, price, advertisementId;
  final VoidCallback press;

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
                      return const Center(child: CustomProgressIndicator());
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
              CupertinoButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        backgroundColor: AppColors.kMainBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Builder(
                          builder: (builderContext) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: EdgeInsets.all(20.r),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.withValues(alpha: 0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(12.r),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red.withValues(
                                          alpha: 0.3,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      padding: EdgeInsets.all(10.r),
                                      child: const Center(
                                        child: Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    'Delete Advertisement',
                                    style: AppFonts.font18DarkBold.copyWith(
                                      color: AppColors.kMainTextColor,
                                    ),
                                  ),
                                  verticalSpace(16),
                                  SelectableText(
                                    'Are you sure you want to delete this advertisement?',
                                    textAlign: TextAlign.center,
                                    style: AppFonts.font15DarkMedium.copyWith(
                                      color: AppColors.kMainTextColor,
                                    ),
                                  ),
                                  verticalSpace(32),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(dialogContext);
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                AppColors.kMainAppColor,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 12.r,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            'Cancel',
                                            style: AppFonts.font15DarkMedium
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      horizontalSpace(8),
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(dialogContext);
                                            context
                                                .read<UserAdvertisementsCubit>()
                                                .emitDeleteUserAdvertisement(
                                                  advertisementId,
                                                );
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 12.r,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            'Delete',
                                            style: AppFonts.font15DarkMedium
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                padding: EdgeInsets.zero,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.kMainGreyColor,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.delete,
                      color: Color(0xff767676),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
