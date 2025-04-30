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
                        CustomSellCarTextField(
                          controller:
                              context.read<SellUsedCarCubit>().brandController,
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
                        CustomSellCarTextField(
                          controller:
                              context
                                  .read<SellUsedCarCubit>()
                                  .dealershipController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          title: 'Dealership',
                          hint: 'Car dealership name',
                          icon: 'assets/icons/user.svg',
                        ),
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
