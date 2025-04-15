import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/maintenance_companies/data/models/maintenance_companies_model.dart';

class MaintenanceCompaniesRepo {
  final ApiServices apiServices;

  MaintenanceCompaniesRepo(this.apiServices);

  Future<ApiResult<List<MaintenanceCompaniesModel>>>
  getAllMaintenanceCompanies() async {
    try {
      var response = await apiServices.getAllMaintenanceCompanies();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
