import 'package:carzo/features/brands/data/models/all_brands/all_brands_model.dart';
import 'package:carzo/features/brands/manager/All_brands/all_brands_cubit.dart';
import 'package:carzo/features/brands/manager/All_brands/all_brands_state.dart';
import 'package:carzo/features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import 'package:carzo/features/car_showrooms/manager/showrooms/showrooms_cubit.dart';
import 'package:carzo/features/car_showrooms/manager/showrooms/showrooms_state.dart';
import 'package:carzo/features/sell_car/presentation/widgets/custom_loading_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../../manager/sell_new_car/sell_new_car_cubit.dart';
import '../widgets/custom_new_car_add_image_section.dart';
import '../widgets/custom_sell_button.dart';
import '../widgets/custom_sell_car_text_field.dart';
import '../widgets/custom_sell_note_alert.dart';
import '../widgets/sell_new_car_bloc_listener.dart';

class SellNewCarsView extends StatefulWidget {
  const SellNewCarsView({super.key});

  @override
  State<SellNewCarsView> createState() => _SellNewCarsViewState();
}

class _SellNewCarsViewState extends State<SellNewCarsView> {
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
                  'Selling a new car is only available through official car showrooms. If you want to sell your vehicle, please visit the Sell Personal Car page.',
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
            const CustomMasterAppBar(title: 'Sell New Car'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: context.read<SellNewCarCubit>().formKey,
                    child: Column(
                      children: [
                        verticalSpace(16),
                        Text(
                          'Enter Car Details',
                          style: AppFonts.font18DarkBold,
                        ),
                        verticalSpace(16),
                        const CustomNewCarAddImageSection(),
                        verticalSpace(16),
                        SellNewCarBrandsList(),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().modelController,
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
                              context.read<SellNewCarCubit>().priceController,
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
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().yearController,
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
                                  .read<SellNewCarCubit>()
                                  .fuelEfficiencyController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Liters / 100 Kilometres ',
                          hint: 'Number of liters per 100 kilometres',
                          icon: 'assets/icons/walk-car.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
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
                              context
                                  .read<SellNewCarCubit>()
                                  .topSpeedController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Speed',
                          hint: 'Max speed',
                          icon: 'assets/icons/max-speed.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().fuelController,
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
                              context
                                  .read<SellNewCarCubit>()
                                  .originCountryController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Origin',
                          hint: 'Country of origin',
                          icon: 'assets/icons/country-flag.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .assemblyCountryController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Assembly',
                          hint: 'Country of assembly',
                          icon: 'assets/icons/country-of-assembly.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .horsePowerController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Horses',
                          hint: 'Mechanical horses number',
                          icon: 'assets/icons/horse.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().seatsController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Seat',
                          hint: 'Car Seat Numbers',
                          icon: 'assets/icons/seats-number.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .accelerationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Acceleration',
                          hint: 'Car acceleration',
                          icon: 'assets/icons/car-acceleration.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .drivetrainController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Drivetrain',
                          hint: 'Type of drivetrain in the car',
                          icon: 'assets/icons/candle.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .trunkSizeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Trunk',
                          hint: 'Car trunk capacity',
                          icon: 'assets/icons/trunk capacity.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().gearsController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Gears',
                          hint: 'Gears number',
                          icon: 'assets/icons/gears.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .wheelbaseController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Wheelbase',
                          hint: 'Car wheelbase',
                          icon: 'assets/icons/car-traction2.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .groundClearanceController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Ground',
                          hint: 'Car ground clearance',
                          icon: 'assets/icons/ground-clearance.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().heightController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Height',
                          hint: 'Overall car height',
                          icon: 'assets/icons/Overall-height.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().lengthController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Length',
                          hint: 'Overall car length',
                          icon: 'assets/icons/Overall-length.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().widthController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Width',
                          hint: 'Total width of the car',
                          icon: 'assets/icons/ruler.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context.read<SellNewCarCubit>().colorController,
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
                        SellNewCarShowroomsList(),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellNewCarCubit>()
                                  .locationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
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
                              context.read<SellNewCarCubit>().phoneController,
                          validator: (value) {
                            final trimmedValue = value?.trim() ?? '';
                            if (trimmedValue.isEmpty ||
                                !AppRegex.isPhoneNumberValid(trimmedValue)) {
                              return 'Please enter a valid phone number.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          title: 'Phone Number',
                          hint: 'Owner\'s mobile phone number',
                          icon: 'assets/icons/call.svg',
                        ),
                        verticalSpace(32),
                        CustomSellButton(
                          title: 'Sell Now',
                          press: () {
                            validateThenSellNewCar(context);
                          },
                        ),
                        verticalSpace(32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SellNewCarBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenSellNewCar(BuildContext context) {
    if (context.read<SellNewCarCubit>().formKey.currentState!.validate()) {
      context.read<SellNewCarCubit>().submitCarListing(context);
    }
  }
}

class SellNewCarBrandsList extends StatelessWidget {
  const SellNewCarBrandsList({super.key});

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
                              .read<SellNewCarCubit>()
                              .brandController
                              .text
                              .isEmpty
                          ? null
                          : context
                              .read<SellNewCarCubit>()
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
                      context.read<SellNewCarCubit>().brandController.text =
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
