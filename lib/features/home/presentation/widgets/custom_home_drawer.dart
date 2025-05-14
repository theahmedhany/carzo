import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import 'custom_home_drawer_item.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: ListView(
          children: [
            verticalSpace(30),
            Padding(
              padding: EdgeInsets.only(right: 12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      scaffoldKey.currentState?.closeDrawer();
                    },
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset(
                      'assets/icons/close-square.svg',
                      width: 30.w,
                      height: 30.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.kMainTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(30),
            CustomHomeDrawerItem(
              text: 'New Cars',
              icon: 'assets/icons/car-brand.svg',
              press: () {
                context.pushNamed(Routes.newCarsView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Used Cars',
              icon: 'assets/icons/walk-car.svg',
              press: () {
                context.pushNamed(Routes.usedCarsView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Sell Car',
              icon: 'assets/icons/sell-car.svg',
              press: () {
                context.pushNamed(Routes.sellCarView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Car Showrooms',
              icon: 'assets/icons/company.svg',

              press: () {
                context.pushNamed(Routes.fullCarShowroomsView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Insurance Companies',
              icon: 'assets/icons/insurance-companey.svg',
              press: () {
                context.pushNamed(Routes.insuranceCompaniesView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Maintenance Companies',
              icon: 'assets/icons/mainainance-companies.svg',
              press: () {
                context.pushNamed(Routes.maintenanceCompaniesView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Rescue Companies',
              icon: 'assets/icons/rescue-companies.svg',
              press: () {
                context.pushNamed(Routes.rescueCompaniesView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(10),
            CustomHomeDrawerItem(
              text: 'Settings',
              icon: 'assets/icons/setting.svg',
              press: () {
                context.pushNamed(Routes.personalDetailsView);
                scaffoldKey.currentState?.closeDrawer();
              },
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
