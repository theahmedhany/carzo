import 'package:carzo/core/helpers/app_regex.dart';
import 'package:carzo/features/login_and_signup/manager/signup/signup_cubit.dart';
import 'package:carzo/features/login_and_signup/presentation/widgets/password_validations.dart';
import 'package:carzo/features/login_and_signup/presentation/widgets/signup_bloc_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../widgets/custom_master_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(6),
                Row(
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        context.pop();
                      },
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(
                        'assets/icons/arrow-square-left.svg',
                        width: 26.r,
                        height: 26.r,
                        colorFilter: ColorFilter.mode(
                          AppColors.kMainAppColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                SizedBox(
                  width: 200.w,
                  child: const Image(
                    image: AssetImage('assets/master/carzo_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                verticalSpace(40),
                Text('Sign up', style: AppFonts.font26DarkBold),
                verticalSpace(30),
                Form(
                  key: context.read<SignupCubit>().formKey,
                  child: Column(
                    children: [
                      CustomMasterTextField(
                        title: 'FIRST NAME',
                        hint: 'Enter your first name.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your first name.';
                          }
                          return null;
                        },
                        controller:
                            context.read<SignupCubit>().firstNameController,
                      ),
                      verticalSpace(26),
                      CustomMasterTextField(
                        title: 'LAST NAME',
                        hint: 'Enter your last name.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your last name.';
                          }
                          return null;
                        },
                        controller:
                            context.read<SignupCubit>().lastNameController,
                      ),
                      verticalSpace(26),
                      CustomMasterTextField(
                        title: 'PHONE NUMBER',
                        hint: 'Enter your phone number.',

                        validator: (value) {
                          final trimmedValue = value?.trim() ?? '';
                          if (trimmedValue.isEmpty ||
                              !AppRegex.isPhoneNumberValid(trimmedValue)) {
                            return 'Please Enter a valid phone number.';
                          }
                          return null;
                        },
                        controller:
                            context.read<SignupCubit>().phoneNumberController,
                      ),
                      verticalSpace(26),
                      CustomMasterTextField(
                        title: 'USERNAME',
                        hint: 'Enter your username.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter a valid username.';
                          }
                          return null;
                        },
                        controller:
                            context.read<SignupCubit>().userNameController,
                      ),
                      verticalSpace(26),
                      CustomMasterTextField(
                        title: 'EMAIL',
                        hint: 'Enter your email.',
                        validator: (value) {
                          final trimmedValue = value?.trim() ?? '';
                          if (trimmedValue.isEmpty ||
                              !AppRegex.isEmailValid(trimmedValue)) {
                            return 'Please Enter a valid email.';
                          }
                          return null;
                        },
                        controller: context.read<SignupCubit>().emailController,
                      ),
                      verticalSpace(26),
                      CustomMasterTextField(
                        title: 'PASSWORD',
                        hint: 'Enter your password.',
                        isObscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid password.';
                          }
                          if (!AppRegex.hasLowerCase(value)) {
                            return 'Password must contain a lowercase letter.';
                          }
                          if (!AppRegex.hasUpperCase(value)) {
                            return 'Password must contain an uppercase letter.';
                          }
                          if (!AppRegex.hasNumber(value)) {
                            return 'Password must contain a number.';
                          }
                          if (!AppRegex.hasSpecialCharacter(value)) {
                            return 'Password must contain a special character.';
                          }
                          if (!AppRegex.hasMinLength(value)) {
                            return 'Password must be at least 8 characters long.';
                          }
                          return null;
                        },
                        controller:
                            context.read<SignupCubit>().passwordController,
                      ),
                      verticalSpace(16),
                      PasswordValidations(
                        hasLowerCase: hasLowercase,
                        hasUpperCase: hasUppercase,
                        hasSpecialCharacters: hasSpecialCharacters,
                        hasNumber: hasNumber,
                        hasMinLength: hasMinLength,
                      ),
                      CupertinoButton(
                        onPressed: () {
                          validateThenDoSignup(context);
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.r,
                            vertical: 10.r,
                          ),
                          margin: EdgeInsets.only(top: 24.r),
                          decoration: ShapeDecoration(
                            color: AppColors.kMainAppColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: AppFonts.font18WhiteRegular,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(14),
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account ? ",
                            style: TextStyle(
                              color: const Color(0xCC4A628A),
                              fontSize: 16.sp,
                              height: 0,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: const Color(0xFF8FBFC2),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(28),
                      SignupBlocListener(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
