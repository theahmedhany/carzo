import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/showrooms/showrooms_model.dart';

class ShowroomsRepo {
  final ApiServices apiServices;

  ShowroomsRepo(this.apiServices);

  Future<ApiResult<List<ShowroomsModel>>> getAllCarShowrooms() async {
    try {
      var response = await apiServices.getAllCarShowrooms();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
