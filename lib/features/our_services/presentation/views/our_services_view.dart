import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_our_services_card.dart';

class OurServicesView extends StatelessWidget {
  OurServicesView({super.key});

  final List<List<String>> OurServices = [
    ['New Cars', 'assets/images/new-cars-image.png', Routes.newCarsView],
    ['Used Cars', 'assets/images/used-car.png', Routes.usedCarsView],
    ['Sell Car  ', 'assets/images/sell-car.png', Routes.sellCarView],
    [
      'Car\nShowrooms',
      'assets/images/carn-showrooms.png',
      Routes.fullCarShowroomsView,
    ],
    [
      'Insurance\nCompanies',
      'assets/images/insurancen-companies.png',
      Routes.insuranceCompaniesView,
    ],
    [
      'Maintenance\nCompanies',
      'assets/images/maintenance-companies.png',
      Routes.maintenanceCompaniesView,
    ],
    [
      'Rescue\nCompanies',
      'assets/images/rescue-companies.png',
      Routes.rescueCompaniesView,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: CustomMasterAppBar(title: 'Our Services'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: OurServices.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 8.r, bottom: 28.r),
              itemBuilder: (context, index) {
                return CustomOurServicesCard(
                  title: OurServices[index][0],
                  image: OurServices[index][1],
                  navigate: OurServices[index][2],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
