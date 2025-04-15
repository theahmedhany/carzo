import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/rescue_companies/data/models/rescue_companies_model.dart';

class RescueCompaniesRepo {
  final ApiServices apiServices;

  RescueCompaniesRepo(this.apiServices);

  Future<ApiResult<List<RescueCompaniesModel>>> getAllRescueCompanies() async {
    try {
      var response = await apiServices.getAllRescueCompanies();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
