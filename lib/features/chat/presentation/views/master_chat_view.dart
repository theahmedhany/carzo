import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../../home/presentation/widgets/custom_home_app_bar.dart';
import '../widgets/custom_master_chat_view_card.dart';

class MasterChatView extends StatelessWidget {
  const MasterChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomHomeAppBar(),
            CustomMasterChatViewCard(
              title: 'Help Support Chat',
              image: 'assets/images/chat_bot.png',
              navigate: () {
                context.pushNamed(Routes.helpSupportChatView);
              },
            ),
            CustomMasterChatViewCard(
              title: 'Customer Service Center',
              image: 'assets/images/customer_service.png',
              navigate: () {
                String? encodeQueryParameters(Map<String, String> params) {
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
          ],
        ),
      ),
    );
  }
}
