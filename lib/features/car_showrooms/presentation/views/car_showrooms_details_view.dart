import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../../data/models/showrooms/showrooms_model.dart';
import '../widgets/car_showrooms_details_card.dart';
import '../widgets/car_showrooms_grid_view.dart';

class CarShowroomsDetailsView extends StatelessWidget {
  const CarShowroomsDetailsView({super.key, required this.company});

  final ShowroomsModel company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CustomMasterAppBar(title: 'Showroom Details'),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  SliverToBoxAdapter(
                    child: CarShowroomsDetailsCard(
                      title: company.name ?? "Unknown",
                      image: company.pictureUrl ?? "",
                      company: company,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  const SliverToBoxAdapter(child: CarShowroomsGridView()),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
