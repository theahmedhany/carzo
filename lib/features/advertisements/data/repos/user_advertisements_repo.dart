import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/networking/dio_factory.dart';
import '../models/user_advertisements_model.dart';

class UserAdvertisementsRepo {
  final ApiServices apiServices;

  UserAdvertisementsRepo(this.apiServices);

  Future<ApiResult<List<UserAdvertisementsModel>>>
  getUserAdvertisements() async {
    try {
      var response = await apiServices.getUserAdvertisements();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<void>> deleteUserAdvertisement(
    String advertisementId,
  ) async {
    try {
      DioFactory.getDio();
      await apiServices.deleteUserAdvertisement(advertisementId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
