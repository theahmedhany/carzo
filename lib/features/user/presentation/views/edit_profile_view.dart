import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_edit_profile_button.dart';
import '../widgets/custom_edit_profile_text_field.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Edit Profile'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.r,
                    vertical: 12.r,
                  ),
                  child: Column(
                    children: [
                      verticalSpace(14),
                      Stack(
                        children: [
                          Image(
                            image: const AssetImage('assets/images/user.png'),
                            fit: BoxFit.contain,
                            height: 130.h,
                            width: 130.w,
                          ),
                          Positioned(
                            bottom: 3,
                            right: 6,
                            child: CupertinoButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              child: Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      width: 1.w,
                                      color: AppColors.kMainGreyColor,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/pen.svg',
                                    width: 15.w,
                                    height: 15.h,
                                    colorFilter: const ColorFilter.mode(
                                      Color(0xff767676),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(14),
                      Text(
                        'Scarlett Johansson',
                        style: AppFonts.font16DarkSemiBold,
                      ),
                      verticalSpace(24),
                      const CustomEditProfileTextField(hint: 'Scarlett'),
                      verticalSpace(16),
                      const CustomEditProfileTextField(hint: ' Johansson'),
                      verticalSpace(16),
                      const CustomEditProfileTextField(
                        hint: 'ScarlettJohansson@gmail.com',
                      ),
                      verticalSpace(16),
                      const CustomEditProfileTextField(hint: '01020304050'),
                      verticalSpace(48),
                      CustomEditProfileButton(
                        title: 'Save Changes',
                        press: () {},
                      ),
                      verticalSpace(16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
