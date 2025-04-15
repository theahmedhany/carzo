import '../../manager/search_cars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class CustomSearchBrandList extends StatefulWidget {
  final Function(String) onBrandSelected;

  const CustomSearchBrandList({super.key, required this.onBrandSelected});

  @override
  _CustomSearchBrandListState createState() => _CustomSearchBrandListState();
}

class _CustomSearchBrandListState extends State<CustomSearchBrandList> {
  int _selectedIndex = 0;

  final List<List<String>> OurBrands = [
    ['ALL', 'assets/images/Brands/all-cars.png'],
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
    ['Geely', 'assets/images/Brands/Geely.png'],
    ['Cadillac', 'assets/images/Brands/Cadillac.png'],
    ['Land Rover', 'assets/images/Brands/Land Rover.png'],
    ['Porsche', 'assets/images/Brands/Porsche.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: OurBrands.length,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      itemBuilder: (context, index) {
        final bool isSelected = index == _selectedIndex;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onBrandSelected(OurBrands[index][0]);
            context.read<SearchCarsCubit>().emitGetFilteredCars(
              OurBrands[index][0],
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.r),
            child: Container(
              width: 100.w,
              decoration: ShapeDecoration(
                color:
                    isSelected ? AppColors.kMainAppColor : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 12.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kMainAppColor,
                        ),
                        child: Center(
                          child: Image.asset(
                            OurBrands[index][1],
                            height: 25.h,
                            width: 25.w,
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(6),
                    Text(
                      OurBrands[index][0].length > 4
                          ? '${OurBrands[index][0].substring(0, 4)}...'
                          : OurBrands[index][0],
                      style: TextStyle(
                        color:
                            isSelected
                                ? Colors.white
                                : AppColors.kSecondaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
