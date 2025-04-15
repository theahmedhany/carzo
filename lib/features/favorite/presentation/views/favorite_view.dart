import 'package:carzo/core/theming/app_fonts.dart';
import 'package:carzo/features/favorite/data/models/favorite_car_model.dart';
import 'package:carzo/features/favorite/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../home/presentation/widgets/custom_home_app_bar.dart';
import '../widgets/favorite_cars_grid_view.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHomeAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: BlocConsumer<FavoriteCubit, List<FavoriteCarModel>>(
                  listener: (context, state) {},
                  builder: (context, favoriteCars) {
                    if (favoriteCars.isEmpty) {
                      return Center(
                        child: Text(
                          "No favorite cars yet",
                          style: AppFonts.font16DarkSemiBold,
                        ),
                      );
                    }
                    return FavoriteCarsGridView(favoriteCars: favoriteCars);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
