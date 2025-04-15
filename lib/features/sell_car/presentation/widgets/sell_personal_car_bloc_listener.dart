import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/widgets/custom_alert_dialog.dart';
import 'package:carzo/core/widgets/main_loading_indicator.dart';
import 'package:carzo/features/sell_car/manager/sell_personal_car/sell_personal_car_cubit.dart';
import 'package:carzo/features/sell_car/manager/sell_personal_car/sell_personal_car_state.dart';
import 'package:carzo/features/sell_car/presentation/widgets/custom_sell_car_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellPersonalCarBlocListener extends StatelessWidget {
  const SellPersonalCarBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellPersonalCarCubit, SellPersonalCarState>(
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
