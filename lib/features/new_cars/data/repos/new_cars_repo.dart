import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/new_car_model.dart';

class NewCarsRepo {
  final ApiServices apiServices;

  NewCarsRepo(this.apiServices);

  Future<ApiResult<List<NewCarModel>>> getAllNewCars(
    String selectedBrand,
  ) async {
    try {
      var response = await apiServices.getAllNewCars(selectedBrand);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
