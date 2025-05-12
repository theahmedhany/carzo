import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/theming/app_fonts.dart';
import 'package:carzo/core/widgets/custom_list_view_loading.dart';
import 'package:carzo/core/widgets/custom_master_app_bar.dart';
import 'package:carzo/core/widgets/error_page.dart';
import 'package:carzo/features/advertisements/data/models/user_advertisements_model.dart';
import 'package:carzo/features/advertisements/manager/user_advertisements_cubit.dart';
import 'package:carzo/features/advertisements/manager/user_advertisements_state.dart';
import 'package:carzo/features/advertisements/presentation/widgets/custom_user_advertisements_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAdvertisementsView extends StatelessWidget {
  const UserAdvertisementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: CustomMasterAppBar(title: 'Selled Cars History'),
          ),
          Expanded(
            child: BlocBuilder<
              UserAdvertisementsCubit,
              UserAdvertisementsState<List<UserAdvertisementsModel>>
            >(
              builder: (context, state) {
                return state.when(
                  idle: () => const Center(child: CustomListViewLoading()),
                  loading: () => const Center(child: CustomListViewLoading()),
                  success: (userAdvertisementsList) {
                    if (userAdvertisementsList.isEmpty) {
                      return Center(
                        child: Text(
                          'No advertisements found',
                          style: AppFonts.font16DarkSemiBold,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: userAdvertisementsList.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 8.r, bottom: 28.r),
                      itemBuilder: (context, index) {
                        return CustomUserAdvertisementsCard(
                          image: userAdvertisementsList[index].image?.url ?? '',
                          title:
                              '${userAdvertisementsList[index].brand} ${userAdvertisementsList[index].model}',
                          price: userAdvertisementsList[index].price.toString(),
                          advertisementId:
                              userAdvertisementsList[index].id?.toString() ??
                              '',
                          press: () {
                            carDetailsStatus = 'Used';
                            carDetailsId =
                                userAdvertisementsList[index].carId.toString();
                            context.pushNamed(Routes.carDetailsView);
                          },
                        );
                      },
                    );
                  },
                  error: (errorMsg) {
                    return ErrorPage(error: 'Error: $errorMsg');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
