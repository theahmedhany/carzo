import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_sell_car_card.dart';
import '../widgets/popular_cars_section.dart';

class SellCarView extends StatelessWidget {
  const SellCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Sell Car'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(4),
                    const CustomSellCarCard(
                      title: 'Personal Car',
                      image: 'assets/images/personal_car.png',
                      navigate: Routes.sellPersonalCarView,
                    ),
                    const CustomSellCarCard(
                      title: 'New Car',
                      image: 'assets/images/sell-new-car.png',
                      navigate: Routes.sellNewCarsView,
                    ),
                    const CustomSellCarCard(
                      title: 'Used Car',
                      image: 'assets/images/sell-used-car.png',
                      navigate: Routes.sellUsedCarView,
                    ),
                    verticalSpace(150),
                    const PopularCarsSection(),
                    verticalSpace(28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
