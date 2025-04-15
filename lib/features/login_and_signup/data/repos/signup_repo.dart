import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/login_and_signup/data/models/signup/signup_request_body.dart';
import 'package:carzo/features/login_and_signup/data/models/signup/signup_response.dart';

class SignupRepo {
  final ApiServices _apiServices;

  SignupRepo(this._apiServices);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiServices.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
