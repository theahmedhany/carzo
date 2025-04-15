import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/search/data/models/search_cars_model.dart';

class SearchCarsRepo {
  final ApiServices apiServices;

  SearchCarsRepo(this.apiServices);

  Future<ApiResult<List<SearchCarsModel>>> getCarsBySearch(
    String selectedBrand,
  ) async {
    try {
      var response = await apiServices.getCarsBySearch(selectedBrand);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
