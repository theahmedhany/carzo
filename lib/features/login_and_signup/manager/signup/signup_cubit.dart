import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/signup/signup_request_body.dart';
import '../../data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.idle());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const SignupState.loading());
    try {
      final response = await _signupRepo.signup(
        SignupRequestBody(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          userName: userNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.when(
        success: (signupResponse) async {
          emit(SignupState.success(signupResponse));
        },
        failure: (error) {
          emit(
            SignupState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        SignupState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
