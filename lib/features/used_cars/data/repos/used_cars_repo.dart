import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/used_car_model.dart';

class UsedCarsRepo {
  final ApiServices apiServices;

  UsedCarsRepo(this.apiServices);

  Future<ApiResult<List<UsedCarModel>>> getAllUsedCars() async {
    try {
      var response = await apiServices.getAllUsedCars();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
