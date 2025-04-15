import 'package:cached_network_image/cached_network_image.dart';
import 'package:carzo/core/helpers/launch_custom_url.dart';
import 'package:carzo/core/widgets/custom_company_details_alert.dart';
import 'package:carzo/core/widgets/custom_progress_indicator.dart';
import 'package:carzo/core/widgets/show_snack_bar.dart';
import 'package:carzo/features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/car_showrooms_grid_view.dart';

class CarShowroomsDetailsView extends StatelessWidget {
  const CarShowroomsDetailsView({super.key, required this.company});

  final ShowroomsModel company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Showroom Details'),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  SliverToBoxAdapter(
                    child: CarShowroomsDetailsCard(
                      title: company.name ?? "Unknown",
                      image: company.pictureUrl ?? "",
                      company: company,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  SliverToBoxAdapter(child: CarShowroomsGridView()),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                    return Center(child: CustomProgressIndicator());
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

          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                title.length > 24 ? '${title.substring(0, 24)}...' : title,

                style: AppFonts.font18DarkSemiBold,
              ),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          return CustomCompanyDetailsAlert(
                            dialogIcon: 'assets/icons/call.svg',
                            dialogHeader: 'Phone Number',
                            dialogBody: '+2${company.phone1.toString()}',
                            press: () {
                              launchCustomUrl(
                                context,
                                'tel:+2${company.phone1.toString()}',
                              );
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
                          return CustomCompanyDetailsAlert(
                            dialogIcon: 'assets/icons/Whatsapp.svg',
                            dialogHeader: 'WhatsApp',
                            dialogBody: '+2${company.whatsApp1.toString()}',
                            press: () async {
                              final phone = company.whatsApp1 ?? '';
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
          Spacer(),
        ],
      ),
    );
  }
}

class CarShowroomsIconCircle extends StatelessWidget {
  const CarShowroomsIconCircle({
    super.key,
    required this.image,
    required this.press,
  });

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: ShapeDecoration(
          color: AppColors.kMainAppColor,
          shape: CircleBorder(
            side: BorderSide(width: 1.w, color: AppColors.kMainAppColor),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            width: 20.w,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
