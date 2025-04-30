import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../widgets/custom_new_cars_brand_list.dart';
import '../widgets/new_cars_grid_view.dart';

class NewCarsView extends StatelessWidget {
  const NewCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: CustomMasterAppBar(title: 'New Cars'),
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: verticalSpace(20)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 40.h,
                    child: const CustomNewCarsBrandList(),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(20)),
                const SliverToBoxAdapter(child: NewCarsGridView()),
                SliverToBoxAdapter(child: verticalSpace(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
