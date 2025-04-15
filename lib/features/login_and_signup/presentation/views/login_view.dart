import 'package:carzo/core/helpers/app_regex.dart';
import 'package:carzo/features/login_and_signup/manager/login/login_cubit.dart';
import 'package:carzo/features/login_and_signup/presentation/widgets/login_bloc_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(70),
                SizedBox(
                  width: 200.w,
                  child: const Image(
                    image: AssetImage('assets/master/carzo_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                verticalSpace(70),
                Text('Welcome to Carzo', style: AppFonts.font26DarkBold),
                verticalSpace(50),
                Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'EMAIL',
                          style: AppFonts.font12DarkMedium.copyWith(
                            height: 0.5,
                            letterSpacing: 1.89,
                          ),
                        ),
                      ),
                      verticalSpace(10),
                      TextFormField(
                        controller: context.read<LoginCubit>().emailController,
                        validator: (value) {
                          final trimmedValue = value?.trim() ?? '';
                          if (trimmedValue.isEmpty ||
                              !AppRegex.isEmailValid(trimmedValue)) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: AppColors.kMainAppColor,
                          fontSize: 14.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Please Enter your email.',
                          hintStyle: const TextStyle(color: Color(0x7F4A628A)),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(26),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'PASSWORD',
                          style: AppFonts.font12DarkMedium.copyWith(
                            height: 0.5,
                            letterSpacing: 1.89,
                          ),
                        ),
                      ),
                      verticalSpace(10),
                      TextFormField(
                        controller:
                            context.read<LoginCubit>().passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        style: TextStyle(
                          color: AppColors.kMainAppColor,
                          fontSize: 14.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Please Enter your password.',
                          hintStyle: const TextStyle(color: Color(0x7F4A628A)),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(8),
                      CupertinoButton(
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.r,
                            vertical: 10.r,
                          ),
                          margin: EdgeInsets.only(top: 40.r),
                          decoration: ShapeDecoration(
                            color: AppColors.kMainAppColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: AppFonts.font18WhiteRegular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(14),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.signupView);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                        color: const Color(0xCC4A628A),
                        fontSize: 16.sp,
                        height: 0,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
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
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
