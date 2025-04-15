import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/main_loading_indicator.dart';
import '../../manager/sell_new_car/sell_new_car_cubit.dart';
import '../../manager/sell_new_car/sell_new_car_state.dart';
import 'custom_sell_car_alert_dialog.dart';

class SellNewCarBlocListener extends StatelessWidget {
  const SellNewCarBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellNewCarCubit, SellNewCarState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (loginResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          error: (error) {
            _showErrorDialog(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => CustomSellCarAlertDialog(
            dialogColor: Colors.redAccent,
            dialogHeader: 'Sell Car Failed',
            dialogBody: error,
            dialogIcon: Icons.error,
            press: () => context.pop(),
          ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.kMainAppColor.withValues(alpha: 0.3),
      builder: (context) => Center(child: const MainLoadingIndicator()),
    );
  }

  void showSuccessDialog(BuildContext context) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => CustomAlertDialog(
            dialogColor: AppColors.kMainAppColor,
            dialogHeader: 'Sell Car Success',
            dialogBody: 'Congratulations, your car has been sold successfully!',
            dialogIcon: Icons.check_circle_rounded,
            press: () {
              context.pop();
            },
          ),
    );
  }
}
