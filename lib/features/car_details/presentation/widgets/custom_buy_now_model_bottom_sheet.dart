import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/launch_custom_url.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        return CustomDetailsAlertDialog(
                          dialogColor: Color(0xffB9E5E8),
                          dialogIcon: 'assets/icons/call.svg',
                          dialogHeader: 'Phone Number',
                          dialogBody: '+2${details.phone}',
                          press: () {
                            launchCustomUrl(
                              context,
                              'tel:${details.phone ?? ''}',
                            );
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
                        return CustomDetailsAlertDialog(
                          dialogColor: Color(0xffB9E5E8),
                          dialogIcon: 'assets/icons/Whatsapp.svg',
                          dialogHeader: 'WhatsApp',
                          dialogBody: '+2${details.phone}',
                          press: () async {
                            final phone = details.phone ?? '';
                            final message = Uri.encodeComponent(
                              'Hello, I need assistance with...',
                            );
                            final url = Uri.parse(
                              'https://wa.me/+2$phone?text=$message',
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
                          dialogColor: Color(0xffB9E5E8),
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
