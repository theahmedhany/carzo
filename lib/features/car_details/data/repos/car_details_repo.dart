import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/car_details/data/models/car_details_model.dart';

class CarDetailsRepo {
  final ApiServices apiServices;

  CarDetailsRepo(this.apiServices);

  Future<ApiResult<CarDetailsModel>> getCarDetails(
    String carStatus,
    String carId,
  ) async {
    try {
      var response = await apiServices.getCarDetails(carStatus, carId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
