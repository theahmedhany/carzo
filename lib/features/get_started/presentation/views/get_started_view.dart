import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/custom_background_image.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_description.dart';
import '../widgets/custom_dots.dart';
import '../widgets/custom_logo_image.dart';
import '../widgets/custom_title.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  int currentIndex = 0;
  late PageController _controller;

  final List getStartedData = [
    ['Welcome to\nCarzo.', '', 'assets/images/get_started_background1.png'],
    [
      'Lets Start...\nFind a perfect and favorite car for you.',
      'Discover your next adventure with Carzo. We\'re here to provide a seamless car sale experience.\n\nLet’s get started on your journey.',
      'assets/images/get_started_background2.png',
    ],
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainAppColor,
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemCount: getStartedData.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CustomBackgroundImage(
                imagePath: getStartedData[index][2],
                currentIndex: currentIndex,
              ),
              SafeArea(
                bottom: false,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 32.r, top: 12.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (currentIndex == 1) {
                                  _controller.previousPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  );
                                } else {
                                  context.pushNamed(Routes.loginView);
                                }
                              },
                              child: Text(
                                currentIndex == 1 ? 'Back' : 'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomLogoImage(),
                      CustomTitle(
                        title: getStartedData[index][0],
                        currentIndex: currentIndex,
                      ),
                      const Spacer(),
                      CustomDescription(description: getStartedData[index][1]),
                      const Spacer(),
                      CustomDots(
                        currentIndex: currentIndex,
                        itemCount: getStartedData.length,
                      ),
                      CustomButton(
                        currentIndex: currentIndex,
                        controller: _controller,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
