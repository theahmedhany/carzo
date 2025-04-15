import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class HelpSupportChatMessageInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onSend;

  const HelpSupportChatMessageInput({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                maxLines: 5,
                minLines: 1,
                controller: controller,
                cursorColor: AppColors.kMainAppColor,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kMainTextColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Write your message...',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.kMainTextColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(width: 1.5),
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
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.kMainAppColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                isLoading
                    ? Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SizedBox(
                        width: 26.w,
                        height: 26.h,
                        child: CupertinoActivityIndicator(
                          color: AppColors.kMainBackgroundColor,
                        ),
                      ),
                    )
                    : CupertinoButton(
                      onPressed: onSend,
                      padding: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/icons/send_icon.svg',
                          width: 32,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
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
