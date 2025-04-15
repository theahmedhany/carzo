import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routing/routes.dart';
import 'package:carzo/core/theming/app_colors.dart';
import 'package:carzo/core/widgets/custom_alert_dialog.dart';
import 'package:carzo/core/widgets/main_loading_indicator.dart';
import 'package:carzo/features/login_and_signup/manager/login/login_cubit.dart';
import 'package:carzo/features/login_and_signup/manager/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (loginResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeView,
              predicate: (route) => false,
            );
          },
          error: (error) => _showErrorDialog(context, error),
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
          (context) => CustomAlertDialog(
            dialogColor: Colors.redAccent,
            dialogHeader: 'Login Failed',
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
}
