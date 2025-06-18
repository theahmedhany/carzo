import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_brands_icon.dart';

class BrandsView extends StatelessWidget {
  BrandsView({super.key});

  final List<List<String>> OurBrands = [
    ['BMW', 'assets/images/Brands/BMW.png'],
    ['Mercedes', 'assets/images/Brands/Mercedes-Benz.png'],
    ['Audi', 'assets/images/Brands/Audi.png'],
    ['Kia', 'assets/images/Brands/Kia.png'],
    ['Hyundai', 'assets/images/Brands/Hyundai.png'],
    ['Toyota', 'assets/images/Brands/Toyota.png'],
    ['Nissan', 'assets/images/Brands/Nissan.png'],
    ['Chevrolet', 'assets/images/Brands/Chevrolet.png'],
    ['Renault', 'assets/images/Brands/Renault.png'],
    ['Mitsubishi', 'assets/images/Brands/Mitsubishi.png'],
    ['Peugeot', 'assets/images/Brands/Peugeot.png'],
    ['Chery', 'assets/images/Brands/Chery.png'],
    ['MG', 'assets/images/Brands/MG.png'],
    ['Citroën', 'assets/images/Brands/Citroën.png'],
    ['Suzuki', 'assets/images/Brands/Suzuki.png'],
    ['Tesla', 'assets/images/Brands/Tesla.png'],
    ['Avatr', 'assets/images/Brands/Avatr.png'],
    ['BAIC', 'assets/images/Brands/BAIC.png'],
    ['BYD', 'assets/images/Brands/BYD.png'],
    ['Cupra', 'assets/images/Brands/Cupra.png'],
    ['Daewoo', 'assets/images/Brands/Daewoo.png'],
    ['DS', 'assets/images/Brands/DS.png'],
    ['Haval', 'assets/images/Brands/Haval.png'],
    ['Hummer', 'assets/images/Brands/Hummer.png'],
    ['JAC', 'assets/images/Brands/JAC.png'],
    ['Proton', 'assets/images/Brands/Proton.png'],
    ['Opel', 'assets/images/Brands/Opel.png'],
    ['Jaguar', 'assets/images/Brands/Jaguar.png'],
    ['Lexus', 'assets/images/Brands/Lexus.png'],
    ['Infiniti', 'assets/images/Brands/Infiniti.png'],
    ['Jeep', 'assets/images/Brands/Jeep.png'],
    ['Range Rover', 'assets/images/Brands/Range Rover.png'],
    ['Ford', 'assets/images/Brands/Ford.png'],
    ['Mazda', 'assets/images/Brands/Mazda.png'],
    ['Volvo', 'assets/images/Brands/Volvo.png'],
    ['Mini', 'assets/images/Brands/Mini.png'],
    ['Geely', 'assets/images/Brands/Geely.png'],
    ['Cadillac', 'assets/images/Brands/Cadillac.png'],
    ['Land Rover', 'assets/images/Brands/Land Rover.png'],
    ['Porsche', 'assets/images/Brands/Porsche.png'],
    ['Alfa Romeo', 'assets/images/Brands/Alfa Romeo.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: CustomMasterAppBar(title: 'Brands'),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 20.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 14.r,
              ),
              itemCount: OurBrands.length,
              itemBuilder:
                  (_, index) => CustomBrandsIcon(
                    title: OurBrands[index][0],
                    imageSrc: OurBrands[index][1],
                    press: () {
                      masterBrandName = OurBrands[index][0];
                      context.pushNamed(Routes.brandsCarsView);
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
