import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';
import 'custom_master_app_bar.dart';
import 'show_snack_bar.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(child: CustomMasterAppBar(title: 'Privacy Policy')),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.r,
                    vertical: 10.r,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          width: 100.w,
                          height: 100.h,
                          'assets/icons/privacy-policy.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.kMainAppColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      verticalSpace(16),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Privacy Policy',
                          style: AppFonts.font22DarkSemiBold,
                        ),
                      ),
                      verticalSpace(32),
                      Text(
                        'Welcome to Carzo!',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'At Carzo, we care deeply about your privacy. This Privacy Policy outlines how we collect, use, and protect your personal information when you interact with our car browsing and selection app ("App"). By using Carzo, you agree to the practices described below. If you don’t agree, please don’t use the App.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'What Information We Collect',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'Information You Provide',
                        textAlign: TextAlign.start,
                        style: AppFonts.font14DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Account Details: When you sign up, we collect your name, email address, phone number, and password.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Profile Preferences: This includes any information you add to personalize your experience—like favorite vehicles, saved filters, and selections.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Support Interactions: Any messages or communications you send to our customer support.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(16),
                      Text(
                        'Information We Collect Automatically',
                        textAlign: TextAlign.start,
                        style: AppFonts.font14DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Device Data: This includes your mobile device\'s type, operating system, unique identifiers, mobile network, and IP address.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• App Usage: We track how you use Carzo, like what cars you view, your searches, and time spent on different screens, to better understand your preferences.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Location: With your permission, we may collect your precise or approximate location to show relevant car listings and services nearby.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'How We Use Your Information',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'We use your information to:',
                        textAlign: TextAlign.start,
                        style: AppFonts.font14DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Operate, maintain, and improve the App.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Personalize your experience and show relevant vehicle options.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Facilitate purchases, process payments, and deliver services',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Communicate important updates, alerts, or support messages.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Respond to inquiries and customer service requests.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Prevent fraud and ensure platform security.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Analyze app usage trends and optimize performance.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'How Your Information Is Shared',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'We do not sell your data. However, we may share it in the following situations:',
                        textAlign: TextAlign.start,
                        style: AppFonts.font14DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• With Trusted Partners: Third-party vendors and service providers who help us deliver Carzo\'s services.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• With Dealerships: When you request a quote or show interest in a vehicle, we may share your contact details with the relevant dealership or manufacturer.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• For Legal Reasons: If required by law, court order, or government request.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• With Your Consent: Whenever you choose to share your information or link with third-party services.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Your Privacy Choices',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Manage Account Info: You can update or delete your profile anytime through your account settings.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Control Location Sharing: You can turn off location access through your device settings.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Push Notifications: You can opt out anytime via your phone\'s notification settings.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Cookies & Tracking: You may disable cookies via your browser, but some features may not work as intended.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Data Security',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'We implement modern security measures to keep your personal information safe from unauthorized access, misuse, or loss. However, no method of transmission over the internet is 100% secure.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Children\'s Privacy',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'Carzo is not intended for users under 13 years of age. We do not knowingly collect personal data from children. If we learn we’ve received data from someone under 13, we will delete it promptly.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'International Data Transfers',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'If you’re outside the U.S., please be aware your data may be transferred to and processed in the U.S., where privacy laws may differ from those in your location.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Changes to This Policy',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'We may update this Privacy Policy periodically. When we do, we’ll revise the "Effective Date" above and notify you as required, such as through the App or email.',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Contact Us',
                        textAlign: TextAlign.start,
                        style: AppFonts.font18DarkSemiBold,
                      ),
                      verticalSpace(12),
                      Text(
                        'If you have any questions or need to make a dealership with us, feel free to reach out:',
                        style: AppFonts.font12GreyRegular,
                      ),
                      verticalSpace(8),
                      InkWell(
                        onTap: () {
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
                              'subject':
                                  'Have a question or need dealership assistance.',
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
                        borderRadius: BorderRadius.circular(8),
                        child: Text(
                          'Email: carzo.co@hotmail.com',
                          style: AppFonts.font14DarkRegular.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      verticalSpace(32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
