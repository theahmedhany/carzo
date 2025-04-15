import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/car_showrooms/data/models/showroom_cars/showroom_cars_model.dart';

class ShowroomCarsRepo {
  final ApiServices apiServices;

  ShowroomCarsRepo(this.apiServices);

  Future<ApiResult<List<ShowroomCarsModel>>> getCarsByShowroom(
    String showroomId,
  ) async {
    try {
      var response = await apiServices.getCarsByShowroom(showroomId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
