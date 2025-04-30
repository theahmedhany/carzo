import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/launch_custom_url.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_company_details_alert.dart';
import '../../../../core/widgets/custom_company_details_data_box.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../data/models/insurance_companies_model.dart';

class InsuranceCompaniesDetailsView extends StatelessWidget {
  const InsuranceCompaniesDetailsView({super.key, required this.company});

  final InsuranceCompaniesModel company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomMasterAppBar(title: 'Company Details'),
              verticalSpace(32),
              Container(
                width: 200.r,
                height: 200.r,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: AppColors.kMainAppColor,
                      width: 5.w,
                    ),
                  ),
                ),
                child: ClipOval(
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: company.pictureUrl ?? "",
                      width: 200.r,
                      height: 200.r,
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
              verticalSpace(22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  company.name ?? 'Unknown',
                  textAlign: TextAlign.center,
                  style: AppFonts.font22DarkSemiBold,
                ),
              ),
              verticalSpace(22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  company.description ?? 'Unknown',
                  textAlign: TextAlign.center,
                  style: AppFonts.font14GreyRegular,
                ),
              ),
              verticalSpace(28),
              CustomCompanyDetailsDataBox(
                title: 'Phone Number',
                icon: 'assets/icons/call.svg',
                press: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return CustomCompanyDetailsAlert(
                        dialogIcon: 'assets/icons/call.svg',
                        dialogHeader: 'Phone Number',
                        dialogBody: '+2${company.phone}',
                        press: () {
                          launchCustomUrl(
                            context,
                            'tel:+2${company.phone ?? ''}',
                          );
                        },
                      );
                    },
                  );
                },
              ),
              verticalSpace(12),
              CustomCompanyDetailsDataBox(
                title: 'WhatsApp',
                icon: 'assets/icons/Whatsapp.svg',
                press: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return CustomCompanyDetailsAlert(
                        dialogIcon: 'assets/icons/Whatsapp.svg',
                        dialogHeader: 'WhatsApp',
                        dialogBody: '+2${company.whatsApp}',
                        press: () async {
                          final phone = company.whatsApp ?? '';
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
                            showSnackBar(context, 'Could not launch WhatsApp.');
                          }
                        },
                      );
                    },
                  );
                },
              ),
              verticalSpace(12),
              CustomCompanyDetailsDataBox(
                title: 'Address',
                icon: 'assets/icons/location.svg',
                press: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return CustomCompanyDetailsAlert(
                        dialogIcon: 'assets/icons/location.svg',
                        dialogHeader: 'Address',
                        dialogBody: company.location ?? 'Unknown',
                        press: () {
                          launchCustomUrl(context, company.location ?? '');
                        },
                      );
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
