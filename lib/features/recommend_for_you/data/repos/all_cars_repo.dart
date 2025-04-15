import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/recommend_for_you/data/models/all_cars_model.dart';

class AllCarsRepo {
  final ApiServices apiServices;

  AllCarsRepo(this.apiServices);

  Future<ApiResult<List<AllCarsModel>>> getAllCars() async {
    try {
      var response = await apiServices.getAllCars();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
