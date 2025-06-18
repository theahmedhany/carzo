import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/launch_custom_url.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_company_details_alert.dart';
import '../../../../core/widgets/custom_master_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../data/models/car_details_model.dart';
import 'custom_buy_now_model_bottom_sheet.dart';
import 'custom_car_detail_components_list.dart';
import 'custom_car_details_icon_circle.dart';

class CustomCarDetailsSection extends StatelessWidget {
  final CarDetailsModel details;

  const CustomCarDetailsSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 26.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${details.brand} ${details.model}',
                          style: AppFonts.font16DarkBold,
                        ),
                        verticalSpace(8),
                        Text(
                          details.specifications?.description ??
                              'No description',
                          maxLines: 2,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            details.condition ?? 'Unknown',
                            style: AppFonts.font12GreyRegular,
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.r,
                          vertical: 2.r,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.kMainAppColor,
                        ),
                        child: Text(
                          details.status ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(8),
              const Divider(thickness: 1, color: AppColors.kMainGreyColor),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(27.r),
                        child: Container(
                          width: 54.r,
                          height: 54.r,
                          decoration: BoxDecoration(
                            color: AppColors.kMainAppColor.withAlpha(77),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.kMainTextColor,
                              width: 2.r,
                            ),
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: details.dealershipImg ?? '',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              placeholder: (context, url) {
                                return const Center(
                                  child: CustomProgressIndicator(),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: AppColors.kMainTextColor,
                                  child: Text(
                                    details.dealershipName!
                                        .substring(0, 2)
                                        .toUpperCase(),
                                    style: AppFonts.font18WhiteBold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        details.dealershipName ?? '',
                        style: AppFonts.font14DarkSemiBold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomCarDetailsIconCircle(
                        image: 'assets/icons/call.svg',
                        press: () {
                          final formattedPhone =
                              details.phone!.startsWith('0')
                                  ? '+2${details.phone}'
                                  : '+20${details.phone}';
                          showDialog(
                            context: context,
                            builder: (_) {
                              return CustomCompanyDetailsAlert(
                                dialogIcon: 'assets/icons/call.svg',
                                dialogHeader: 'Phone Number',
                                dialogBody: formattedPhone,
                                press: () {
                                  launchCustomUrl(
                                    context,
                                    'tel:$formattedPhone',
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      horizontalSpace(8),
                      CustomCarDetailsIconCircle(
                        image: 'assets/icons/Message-square.svg',
                        press: () {
                          final formattedPhone =
                              details.phone!.startsWith('0')
                                  ? '+2${details.phone}'
                                  : '+20${details.phone}';
                          showDialog(
                            context: context,
                            builder: (_) {
                              return CustomCompanyDetailsAlert(
                                dialogIcon: 'assets/icons/Whatsapp.svg',
                                dialogHeader: 'WhatsApp',
                                dialogBody: formattedPhone,
                                press: () async {
                                  final message = Uri.encodeComponent(
                                    'Hello, I need assistance with...',
                                  );
                                  final url = Uri.parse(
                                    'https://wa.me/$formattedPhone?text=$message',
                                  );

                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(
                                      url,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  } else {
                                    showSnackBar(
                                      context,
                                      'Could not launch WhatsApp.',
                                    );
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(12),
              Row(
                children: [
                  Text('Car Features', style: AppFonts.font14DarkSemiBold),
                ],
              ),
              verticalSpace(12),
              CustomCarDetailComponentsList(details: details),
              verticalSpace(12),
              CustomMasterButton(
                title: 'Buy Now',
                press: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: AppColors.kMainAppColor.withValues(
                      alpha: 0.8,
                    ),
                    context: context,
                    builder: (context) {
                      return CustomBuyNowModelBottomSheet(details: details);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
