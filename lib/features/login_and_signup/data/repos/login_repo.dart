import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/login_and_signup/data/models/login/login_request_body.dart';
import 'package:carzo/features/login_and_signup/data/models/login/login_response.dart';

class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiServices.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
