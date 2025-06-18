import 'package:cached_network_image/cached_network_image.dart';
import 'package:carzo/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../brands/data/models/all_brands/all_brands_model.dart';
import '../../../brands/manager/All_brands/all_brands_cubit.dart';
import '../../../brands/manager/All_brands/all_brands_state.dart';
import '../../manager/sell_personal_car/sell_personal_car_cubit.dart';
import 'custom_loading_text_field.dart';

class SellPersonalCarBrandsList extends StatelessWidget {
  const SellPersonalCarBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBrandsCubit, AllBrandsState<List<AllBrandsModel>>>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Brand',
                style: TextStyle(
                  color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  height: 0.5,
                  letterSpacing: 1.89,
                ),
              ),
            ),
            verticalSpace(6),
            state.when(
              idle:
                  () => CustomLoadingTextField(
                    validator: (value) {},
                    isEnabled: false,
                    keyboardType: TextInputType.text,
                    hint: 'Car brand',
                    icon: 'assets/icons/car-brand.svg',
                  ),
              loading:
                  () => CustomLoadingTextField(
                    validator: (value) {},
                    isEnabled: false,
                    keyboardType: TextInputType.text,
                    hint: 'Loading Brands...',
                    icon: 'assets/icons/car-brand.svg',
                  ),
              error:
                  (error) => CustomLoadingTextField(
                    validator: (value) {},
                    isEnabled: false,
                    keyboardType: TextInputType.text,
                    hint: 'Error loading brands...',
                    icon: 'assets/icons/car-brand.svg',
                  ),
              success: (brands) {
                return DropdownButtonFormField<String>(
                  isExpanded: true,
                  value:
                      context
                              .read<SellPersonalCarCubit>()
                              .brandController
                              .text
                              .isEmpty
                          ? null
                          : context
                              .read<SellPersonalCarCubit>()
                              .brandController
                              .text,
                  items:
                      brands.map((brand) {
                        return DropdownMenuItem<String>(
                          value: brand.name,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading:
                                brand.pictureUrl.isNotEmpty
                                    ? CircleAvatar(
                                      radius: 20.r,
                                      backgroundColor: AppColors.kMainAppColor
                                          .withValues(alpha: 0.2),
                                      child: Container(
                                        margin: EdgeInsets.all(4.r),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: brand.pictureUrl,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: double.infinity,
                                          placeholder: (context, url) {
                                            return const Center(
                                              child: CustomProgressIndicator(),
                                            );
                                          },
                                          errorWidget: (context, url, error) {
                                            return Center(
                                              child: Image.asset(
                                                'assets/master/carzo_logo.png',
                                                width: 40.w,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                    : null,
                            title: Text(
                              brand.name,
                              style: TextStyle(
                                color: AppColors.kMainAppColor.withValues(
                                  alpha: 0.8,
                                ),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                  selectedItemBuilder: (BuildContext context) {
                    return brands.map((brand) {
                      return Text(
                        brand.name,
                        style: TextStyle(
                          color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                          fontSize: 14.sp,
                        ),
                      );
                    }).toList();
                  },
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<SellPersonalCarCubit>()
                          .brandController
                          .text = value;
                    }
                  },
                  style: TextStyle(
                    color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18.r,
                      vertical: 14.r,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18.r, right: 12.r),
                      child: SvgPicture.asset(
                        'assets/icons/car-brand.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.kMainAppColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(width: 1.5.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColors.kMainGreyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColors.kMainGreyColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    hintText: 'Select brand',
                    hintStyle: const TextStyle(color: AppColors.kMainAppColor),
                  ),
                  dropdownColor: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(14),
                  icon: Icon(
                    Icons.arrow_circle_down_rounded,
                    color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                  ),
                  iconSize: 26,
                  elevation: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid brand.';
                    }
                    return null;
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
