import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/insurance_companies/data/models/insurance_companies_model.dart';

class InsuranceCompaniesRepo {
  final ApiServices apiServices;

  InsuranceCompaniesRepo(this.apiServices);

  Future<ApiResult<List<InsuranceCompaniesModel>>>
  getAllInsuranceCompanies() async {
    try {
      var response = await apiServices.getAllInsuranceCompanies();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
