import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/launch_custom_url.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../data/models/car_details_model.dart';
import 'custom_contact_information_card.dart';
import 'custom_details_alert_dialog.dart';

class CustomBuyNowModelBottomSheet extends StatelessWidget {
  const CustomBuyNowModelBottomSheet({super.key, required this.details});

  final CarDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 32.r),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Seller Information', style: AppFonts.font24WhiteBold),
                verticalSpace(22),
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
                    horizontalSpace(24),
                    Text(
                      details.dealershipName ?? 'Unknown',
                      style: AppFonts.font18WhiteBold,
                    ),
                  ],
                ),
                verticalSpace(22),
                CustomContactInformationCard(
                  press: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        final formattedPhone =
                            details.phone!.startsWith('0')
                                ? '+2${details.phone}'
                                : '+20${details.phone}';
                        return CustomDetailsAlertDialog(
                          dialogColor: const Color(0xffB9E5E8),
                          dialogIcon: 'assets/icons/call.svg',
                          dialogHeader: 'Phone Number',
                          dialogBody: formattedPhone,
                          press: () {
                            launchCustomUrl(context, 'tel:$formattedPhone');
                          },
                        );
                      },
                    );
                  },
                  icon: 'assets/icons/call.svg',
                  title: 'Phone Number',
                ),
                verticalSpace(18),
                CustomContactInformationCard(
                  press: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        final formattedPhone =
                            details.phone!.startsWith('0')
                                ? '+2${details.phone}'
                                : '+20${details.phone}';
                        return CustomDetailsAlertDialog(
                          dialogColor: const Color(0xffB9E5E8),
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
                  icon: 'assets/icons/Whatsapp.svg',
                  title: 'WhatsApp',
                ),
                verticalSpace(18),
                CustomContactInformationCard(
                  press: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return CustomDetailsAlertDialog(
                          dialogColor: const Color(0xffB9E5E8),
                          dialogIcon: 'assets/icons/location.svg',
                          dialogHeader: 'Address',
                          dialogBody: details.location ?? 'Unknown',
                          press: () {
                            launchCustomUrl(context, details.location ?? '');
                          },
                        );
                      },
                    );
                  },
                  icon: 'assets/icons/location.svg',
                  title: 'Location',
                ),
                verticalSpace(22),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
