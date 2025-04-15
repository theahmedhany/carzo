import 'package:carzo/core/helpers/shared_pref_helper.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/widgets/custom_alert_dialog.dart';
import 'package:carzo/core/widgets/show_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_personal_details_list_tile.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});

  Future<Map<String, String>> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    return {'name': name, 'email': email};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'User Profile'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 14.r),
                  child: FutureBuilder<Map<String, String>>(
                    future: _loadUserData(),
                    builder: (context, snapshot) {
                      final name = snapshot.data?['name'] ?? 'Unknown Name';
                      final email = snapshot.data?['email'] ?? 'Unknown Email';
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 8.r,
                                    bottom: 8.r,
                                    right: 8.r,
                                  ),
                                  child: Image(
                                    image: const AssetImage(
                                      'assets/images/user.png',
                                    ),
                                    height: 65.h,
                                    width: 65.w,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: AppFonts.font14DarkSemiBold,
                                    ),
                                    Text(
                                      email,
                                      style: AppFonts.font12GreyRegular,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CupertinoButton(
                                  onPressed: () {
                                    // context.pushNamed(Routes.editProfileView);
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => CustomAlertDialog(
                                            dialogColor: Color(0xFFB9E5E8),
                                            dialogHeader: 'Warning',
                                            dialogBody:
                                                'This feature is not available yet.',
                                            dialogIcon: Icons.warning_rounded,
                                            press: () => context.pop(),
                                          ),
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        width: 20.w,
                                        height: 20.h,
                                        'assets/icons/edit-pen.svg',
                                        colorFilter: const ColorFilter.mode(
                                          Color(0xff767676),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      verticalSpace(4),
                                      Text(
                                        'Edit profile',
                                        style: AppFonts.font12GreyRegular,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.r,
                                  horizontal: 16.r,
                                ),
                                child: Text(
                                  'General',
                                  style: AppFonts.font16DarkBold,
                                ),
                              ),
                            ],
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Notifications',
                            image: 'assets/icons/notification.svg',
                            press: () {
                              context.pushNamed(Routes.notificationsView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Sell Car',
                            image: 'assets/icons/sell-car.svg',
                            press: () {
                              context.pushNamed(Routes.sellCarView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Car Showrooms',
                            image: 'assets/icons/company.svg',
                            press: () {
                              context.pushNamed(Routes.fullCarShowroomsView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Insurance Companies',
                            image: 'assets/icons/insurance-companey.svg',
                            press: () {
                              context.pushNamed(Routes.insuranceCompaniesView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Maintenance Companies',
                            image: 'assets/icons/mainainance-companies.svg',
                            press: () {
                              context.pushNamed(
                                Routes.maintenanceCompaniesView,
                              );
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Rescue Companies',
                            image: 'assets/icons/rescue-companies.svg',
                            press: () {
                              context.pushNamed(Routes.rescueCompaniesView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'New Cars',
                            image: 'assets/icons/car-brand.svg',
                            press: () {
                              context.pushNamed(Routes.newCarsView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Used Cars',
                            image: 'assets/icons/walk-car.svg',
                            press: () {
                              context.pushNamed(Routes.usedCarsView);
                            },
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.r,
                                  horizontal: 16.r,
                                ),
                                child: Text(
                                  'Support',
                                  style: AppFonts.font16DarkBold,
                                ),
                              ),
                            ],
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Help Support Chat',
                            image: 'assets/icons/ai_bot.svg',
                            press: () {
                              context.pushNamed(Routes.helpSupportChatView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Customer Service',
                            image: 'assets/icons/support.svg',
                            press: () {
                              String? encodeQueryParameters(
                                Map<String, String> params,
                              ) {
                                return params.entries
                                    .map(
                                      (MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                                    )
                                    .join('&');
                              }

                              final Uri emailUrl = Uri(
                                scheme: 'mailto',
                                path: 'carzo.co@hotmail.com',
                                query: encodeQueryParameters(<String, String>{
                                  'subject': 'Customer Service Inquiry',
                                  'body': 'Hello, I need assistance with...',
                                }),
                              );

                              try {
                                launchUrl(emailUrl);
                              } catch (e) {
                                showSnackBar(
                                  context,
                                  'Could not launch this URL ($emailUrl).',
                                );
                              }
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Invite Friends',
                            image: 'assets/icons/add-user.svg',
                            press: () {
                              Share.share(
                                "Carzo App Link: https://drive.google.com/drive/folders/1e8vG9UGZGYEjfHg40oOXNL-kreVyXYgZ?usp=drive_link",
                              );
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'privacy policy',
                            image: 'assets/icons/privacy-policy.svg',
                            press: () {
                              context.pushNamed(Routes.privacyPolicyView);
                            },
                          ),
                          CustomPersonalDetailsListTile(
                            text: 'Log out',
                            image: 'assets/icons/logout.svg',
                            press: () async {
                              await SharedPrefHelper.clearAllSecuredData();
                              await SharedPrefHelper.clearAllData();
                              context.pushNamedAndRemoveUntil(
                                Routes.getStartedView,
                                predicate: (route) => false,
                              );
                            },
                          ),
                        ],
                      );
                    },
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
