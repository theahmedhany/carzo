import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/widgets/custom_master_app_bar.dart';
import 'package:carzo/features/brands/presentation/widgets/brands_cars_grid_view.dart';
import 'package:flutter/material.dart';

class BrandsCarsView extends StatelessWidget {
  const BrandsCarsView({super.key, required this.brandName});

  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          SafeArea(child: CustomMasterAppBar(title: brandName)),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: verticalSpace(12)),
                SliverToBoxAdapter(child: BrandsCarsGridView()),
                SliverToBoxAdapter(child: verticalSpace(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
