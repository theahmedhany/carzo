import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(child: CustomMasterAppBar(title: 'Notification')),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/notification_page.svg'),
                  verticalSpace(22),
                  Text('NO NOTIFICATIONS', style: AppFonts.font16DarkSemiBold),
                  verticalSpace(12),
                  Text(
                    'Clutter cleared. We\'ll notify you when\nsomething new is found.',
                    textAlign: TextAlign.center,
                    style: AppFonts.font14GreyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
