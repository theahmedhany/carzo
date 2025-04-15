import 'package:carzo/core/helpers/app_regex.dart';
import 'package:carzo/features/sell_car/manager/sell_personal_car/sell_personal_car_cubit.dart';
import 'package:carzo/features/sell_car/presentation/widgets/custom_personal_car_add_image_section.dart';
import 'package:carzo/features/sell_car/presentation/widgets/sell_personal_car_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_sell_button.dart';
import '../widgets/custom_sell_car_text_field.dart';

class SellPersonalCarView extends StatefulWidget {
  const SellPersonalCarView({super.key});

  @override
  State<SellPersonalCarView> createState() => _SellPersonalCarViewState();
}

class _SellPersonalCarViewState extends State<SellPersonalCarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Sell Personal Car'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: context.read<SellPersonalCarCubit>().formKey,
                    child: Column(
                      children: [
                        verticalSpace(16),
                        Text(
                          'Enter Car Details',
                          style: AppFonts.font18DarkBold,
                        ),
                        verticalSpace(16),
                        const CustomPersonalCarAddImageSection(),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellPersonalCarCubit>()
                                  .brandController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid brand.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Brand',
                          hint: 'Car brand',
                          icon: 'assets/icons/car-brand.svg',
                        ),
                        verticalSpace(16),
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellPersonalCarCubit>()
                                  .modelController,
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
                              context
                                  .read<SellPersonalCarCubit>()
                                  .yearOfManufactureController,
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
                                  .read<SellPersonalCarCubit>()
                                  .kilometersController,
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
                                  .read<SellPersonalCarCubit>()
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
                                  .read<SellPersonalCarCubit>()
                                  .fuelController,
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
                                  .read<SellPersonalCarCubit>()
                                  .colorController,
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
                                  .read<SellPersonalCarCubit>()
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
                              context
                                  .read<SellPersonalCarCubit>()
                                  .priceController,
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
                              context
                                  .read<SellPersonalCarCubit>()
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
                              context
                                  .read<SellPersonalCarCubit>()
                                  .contactInfoController,
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
                            validateThenSellPersonalCar(context);
                          },
                        ),
                        verticalSpace(16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SellPersonalCarBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenSellPersonalCar(BuildContext context) {
    if (context.read<SellPersonalCarCubit>().formKey.currentState!.validate()) {
      context.read<SellPersonalCarCubit>().submitCarListing(context);
    }
  }
}
