import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/brand_cars_model.dart';

class BrandCarsRepo {
  final ApiServices apiServices;

  BrandCarsRepo(this.apiServices);

  Future<ApiResult<List<BrandCarsModel>>> getCarsByBrand(
    String selectedBrand,
  ) async {
    try {
      var response = await apiServices.getCarsByBrand(selectedBrand);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
