import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/launch_custom_url.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_company_details_alert.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../data/models/showrooms/showrooms_model.dart';
import 'car_showroomsIcon_circle.dart';

class CarShowroomsDetailsCard extends StatelessWidget {
  const CarShowroomsDetailsCard({
    super.key,
    required this.title,
    required this.image,
    required this.company,
  });

  final String title, image;
  final ShowroomsModel company;

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          horizontalSpace(16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.font18DarkSemiBold,
                  ),
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarShowroomsIconCircle(
                      image: 'assets/icons/location.svg',
                      press: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return CustomCompanyDetailsAlert(
                              dialogIcon: 'assets/icons/location.svg',
                              dialogHeader: 'Address',
                              dialogBody: company.branch1 ?? 'Unknown',
                              press: () {
                                launchCustomUrl(context, company.branch1 ?? '');
                              },
                            );
                          },
                        );
                      },
                    ),
                    CarShowroomsIconCircle(
                      image: 'assets/icons/call.svg',
                      press: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            final formattedPhone =
                                company.phone1.toString().startsWith('0')
                                    ? '+2${company.phone1.toString()}'
                                    : '+20${company.phone1.toString()}';
                            return CustomCompanyDetailsAlert(
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
                    ),
                    CarShowroomsIconCircle(
                      image: 'assets/icons/Whatsapp.svg',
                      press: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            final formattedPhone =
                                company.whatsApp1.toString().startsWith('0')
                                    ? '+2${company.whatsApp1.toString()}'
                                    : '+20${company.whatsApp1.toString()}';
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
                    CarShowroomsIconCircle(
                      image: 'assets/icons/face_book.svg',
                      press: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return CustomCompanyDetailsAlert(
                              dialogIcon: 'assets/icons/face_book.svg',
                              dialogHeader: 'Facebook',
                              dialogBody: company.facebook ?? 'Unknown',
                              press: () {
                                launchCustomUrl(
                                  context,
                                  company.facebook ?? 'Unknown',
                                );
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
          ),
        ],
      ),
    );
  }
}
