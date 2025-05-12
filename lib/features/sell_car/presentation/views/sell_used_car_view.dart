import 'package:carzo/features/brands/data/models/all_brands/all_brands_model.dart';
import 'package:carzo/features/brands/manager/All_brands/all_brands_cubit.dart';
import 'package:carzo/features/brands/manager/All_brands/all_brands_state.dart';
import 'package:carzo/features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import 'package:carzo/features/car_showrooms/manager/showrooms/showrooms_cubit.dart';
import 'package:carzo/features/car_showrooms/manager/showrooms/showrooms_state.dart';
import 'package:carzo/features/sell_car/presentation/widgets/custom_loading_text_field.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/extensions.dart';
import '../../manager/sell_used_car/sell_used_car_cubit.dart';
import '../widgets/custom_sell_note_alert.dart';
import '../widgets/custom_used_car_add_image_section.dart';
import '../widgets/sell_used_car_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_sell_button.dart';
import '../widgets/custom_sell_car_text_field.dart';

class SellUsedCarView extends StatefulWidget {
  const SellUsedCarView({super.key});

  @override
  State<SellUsedCarView> createState() => _SellUsedCarViewState();
}

class _SellUsedCarViewState extends State<SellUsedCarView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder:
            (context) => CustomSellNoteAlert(
              dialogColor: Color(0xffB9E5E8),
              dialogHeader: 'Important Note.',
              dialogBody:
                  'Selling a used car is only available through official car showrooms. If you want to sell your vehicle, please visit the Sell Personal Car page.',
              dialogIcon: Icons.back_hand_outlined,
              press: () {
                context.pop();
              },
            ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Sell Used Car'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: context.read<SellUsedCarCubit>().formKey,
                    child: Column(
                      children: [
                        verticalSpace(16),
                        Text(
                          'Enter Car Details',
                          style: AppFonts.font18DarkBold,
                        ),
                        verticalSpace(16),
                        const CustomUsedCarAddImageSection(),
                        verticalSpace(16),
                        SellUsedCarBrandsList(),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().modelController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid model.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Model',
                          hint: 'Car model',
                          icon: 'assets/icons/car-model.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().yearController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid year.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Year',
                          hint: 'Year of car manufacture',
                          icon: 'assets/icons/calendar.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellUsedCarCubit>()
                                  .mileageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Kilometers',
                          hint: 'Number of kilometers car driven',
                          icon: 'assets/icons/walk-car.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellUsedCarCubit>()
                                  .transmissionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Transmission Type',
                          hint: 'Car transmission type',
                          icon: 'assets/icons/transmission-type.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().fuelController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Fuel',
                          hint: 'Car fuel',
                          icon: 'assets/icons/car-fuel.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().colorController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Color',
                          hint: 'Car color',
                          icon: 'assets/icons/car-color.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellUsedCarCubit>()
                                  .descriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid description.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Description',
                          hint: 'Description',
                          icon: 'assets/icons/edit-pen.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().priceController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid price.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Price',
                          hint: 'Car price',
                          icon: 'assets/icons/moneys.svg',
                        ),
                        verticalSpace(16),
                        SellNewCarShowroomsList(),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellUsedCarCubit>()
                                  .locationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid location.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Location',
                          hint: 'Car location',
                          icon: 'assets/icons/location.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().phoneController,
                          validator: (value) {
                            final trimmedValue = value?.trim() ?? '';
                            if (trimmedValue.isEmpty ||
                                !AppRegex.isPhoneNumberValid(trimmedValue)) {
                              return 'Please enter a valid phone number.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          title: 'Phone Number',
                          hint: 'Owner\'s mobile phone number',
                          icon: 'assets/icons/call.svg',
                        ),
                        verticalSpace(32),
                        CustomSellButton(
                          title: 'Sell Now',
                          press: () {
                            validateThenSellUsedCar(context);
                          },
                        ),
                        verticalSpace(16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SellUsedCarBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenSellUsedCar(BuildContext context) {
    if (context.read<SellUsedCarCubit>().formKey.currentState!.validate()) {
      context.read<SellUsedCarCubit>().submitCarListing(context);
    }
  }
}

class SellUsedCarBrandsList extends StatelessWidget {
  const SellUsedCarBrandsList({super.key});

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
                              .read<SellUsedCarCubit>()
                              .brandController
                              .text
                              .isEmpty
                          ? null
                          : context
                              .read<SellUsedCarCubit>()
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
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              brand.pictureUrl,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
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
                      context.read<SellUsedCarCubit>().brandController.text =
                          value;
                    }
                  },
                  style: TextStyle(
                    color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 16.h,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18.r, right: 12.r),
                      child: SvgPicture.asset(
                        'assets/icons/car-brand.svg',
                        colorFilter: ColorFilter.mode(
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
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.kMainGreyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
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
                              .read<SellUsedCarCubit>()
                              .dealershipController
                              .text
                              .isEmpty
                          ? null
                          : showrooms.firstWhere(
                            (showroom) =>
                                showroom.name ==
                                context
                                    .read<SellUsedCarCubit>()
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
                          .read<SellUsedCarCubit>()
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
                      horizontal: 18.w,
                      vertical: 16.h,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18.r, right: 12.r),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        colorFilter: ColorFilter.mode(
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
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.kMainGreyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
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
