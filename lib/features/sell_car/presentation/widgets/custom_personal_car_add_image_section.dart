import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_master_icon_circle.dart';
import '../../manager/sell_personal_car/sell_personal_car_cubit.dart';
import '../../manager/sell_personal_car/sell_personal_car_state.dart';
import 'custom_car_add_image_box.dart';

class CustomPersonalCarAddImageSection extends StatelessWidget {
  const CustomPersonalCarAddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellPersonalCarCubit, SellPersonalCarState>(
      builder: (context, state) {
        final cubit = context.watch<SellPersonalCarCubit>();
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Car images',
                style: TextStyle(
                  color: AppColors.kMainAppColor.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  height: 0.5,
                  letterSpacing: 1.89,
                ),
              ),
            ),
            verticalSpace(8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              itemCount:
                  cubit.selectedImages.length +
                  (cubit.selectedImages.length < 6 ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == cubit.selectedImages.length) {
                  return CustomCarAddImageBox(
                    onTap: () => _showImagePickerBottomSheet(context),
                  );
                } else {
                  return _buildSelectedImageItem(context, index);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectedImageItem(BuildContext context, int index) {
    final cubit = context.read<SellPersonalCarCubit>();
    final imageFile = cubit.selectedImages[index];

    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 1.5, color: AppColors.kMainGreyColor),
            image: DecorationImage(
              image: FileImage(imageFile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5.r,
          right: 10.r,
          child: GestureDetector(
            onTap: () => cubit.removeImage(index),
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 16.sp),
            ),
          ),
        ),
      ],
    );
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    final cubit = context.read<SellPersonalCarCubit>();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height / 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(10),
                Divider(
                  thickness: 3,
                  color: AppColors.kMainAppColor.withValues(alpha: 0.6),
                  endIndent: MediaQuery.sizeOf(context).width / 2 - 50,
                  indent: MediaQuery.sizeOf(context).width / 2 - 50,
                ),
                verticalSpace(20),
                Text(
                  'Choose an image source',
                  style: AppFonts.font18DarkSemiBold,
                ),
                verticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        cubit.pickImage(ImageSource.gallery, context);
                      },
                      borderRadius: BorderRadius.circular(14),
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          children: [
                            CustomMasterIconCircle(
                              image: 'assets/icons/gallery.svg',
                              press: () {
                                Navigator.pop(context);
                                cubit.pickImage(ImageSource.gallery, context);
                              },
                            ),
                            verticalSpace(10),
                            Text('Gallery', style: AppFonts.font14DarkRegular),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        cubit.pickImage(ImageSource.camera, context);
                      },
                      borderRadius: BorderRadius.circular(14),
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          children: [
                            CustomMasterIconCircle(
                              image: 'assets/icons/camera.svg',
                              press: () {
                                Navigator.pop(context);
                                cubit.pickImage(ImageSource.camera, context);
                              },
                            ),
                            verticalSpace(10),
                            Text('Camera', style: AppFonts.font14DarkRegular),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
