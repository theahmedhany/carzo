import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/car_details_model.dart';
import 'custom_car_details_image_dots.dart';

class CustomCarDetailsCarImages extends StatefulWidget {
  const CustomCarDetailsCarImages({super.key, required this.details});

  final CarDetailsModel details;

  @override
  State<CustomCarDetailsCarImages> createState() =>
      _CustomCarDetailsCarImagesState();
}

class _CustomCarDetailsCarImagesState extends State<CustomCarDetailsCarImages> {
  int currentIndex = 0;
  late PageController _controller;

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.r),
      child: Column(
        children: [
          SizedBox(
            height: 160.h,
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount:
                  widget.details.url!.length < 6
                      ? widget.details.url!.length
                      : 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: widget.details.url![index].url!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) {
                        return Center(child: CustomProgressIndicator());
                      },
                      errorWidget: (context, url, error) {
                        return Center(
                          child: Image.asset(
                            'assets/master/carzo_logo.png',
                            width: 100.w,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpace(18),
          CustomCarDetailsImageDots(
            currentIndex: currentIndex,
            itemCount:
                widget.details.url!.length < 6 ? widget.details.url!.length : 6,
          ),
        ],
      ),
    );
  }
}
