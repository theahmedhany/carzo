import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomHomeSearchBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onSearchPressed;

  const CustomHomeSearchBar({
    super.key,
    required this.scaffoldKey,
    required this.onSearchPressed,
  });

  @override
  State<CustomHomeSearchBar> createState() => _CustomHomeSearchBarState();
}

class _CustomHomeSearchBarState extends State<CustomHomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Row(
        children: [
          CupertinoButton(
            onPressed: () {
              widget.scaffoldKey.currentState?.openDrawer();
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(width: 1.w, color: AppColors.kMainGreyColor),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xff767676),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          horizontalSpace(22),
          Expanded(
            child: CupertinoButton(
              onPressed: widget.onSearchPressed,
              padding: EdgeInsets.zero,
              child: Container(
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search-normal.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xff767676),
                          BlendMode.srcIn,
                        ),
                      ),
                      horizontalSpace(12),
                      Text(
                        'Search your dream car.....',
                        style: AppFonts.font14GreyRegular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
