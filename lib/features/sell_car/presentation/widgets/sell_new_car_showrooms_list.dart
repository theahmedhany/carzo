import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../car_showrooms/data/models/showrooms/showrooms_model.dart';
import '../../../car_showrooms/manager/showrooms/showrooms_cubit.dart';
import '../../../car_showrooms/manager/showrooms/showrooms_state.dart';
import '../../manager/sell_new_car/sell_new_car_cubit.dart';
import 'custom_loading_text_field.dart';

class SellNewCarShowroomsList extends StatelessWidget {
  const SellNewCarShowroomsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowroomsCubit, ShowroomsState<List<ShowroomsModel>>>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dealerships',
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
                    hint: 'Loading showrooms...',
                    icon: 'assets/icons/user.svg',
                  ),
              loading:
                  () => CustomLoadingTextField(
                    validator: (value) {},
                    isEnabled: false,
                    keyboardType: TextInputType.text,
                    hint: 'Loading showrooms...',
                    icon: 'assets/icons/user.svg',
                  ),
              error:
                  (error) => CustomLoadingTextField(
                    validator: (value) {},
                    isEnabled: false,
                    keyboardType: TextInputType.text,
                    hint: 'Error loading showrooms...',
                    icon: 'assets/icons/user.svg',
                  ),
              success: (showrooms) {
                return DropdownButtonFormField<ShowroomsModel>(
                  isExpanded: true,
                  value:
                      context
                              .read<SellNewCarCubit>()
                              .dealershipController
                              .text
                              .isEmpty
                          ? null
                          : showrooms.firstWhere(
                            (showroom) =>
                                showroom.name ==
                                context
                                    .read<SellNewCarCubit>()
                                    .dealershipController
                                    .text,
                            orElse: () => ShowroomsModel(),
                          ),
                  items:
                      showrooms.map((showroom) {
                        return DropdownMenuItem<ShowroomsModel>(
                          value: showroom,
                          child: Text(
                            showroom.name ?? 'Unnamed Showroom',
                            style: TextStyle(
                              color: AppColors.kMainAppColor.withValues(
                                alpha: 0.8,
                              ),
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                  selectedItemBuilder: (BuildContext context) {
                    return showrooms.map((showroom) {
                      return Text(
                        showroom.name ?? 'Unnamed Showroom',
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
                          .read<SellNewCarCubit>()
                          .dealershipController
                          .text = value.name ?? 'Unnamed Showroom';
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
                        'assets/icons/user.svg',
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
                    hintText: 'Car dealership name',
                    hintStyle: TextStyle(
                      color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                    ),
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
                    if (value == null) {
                      return 'Please select a showroom.';
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
