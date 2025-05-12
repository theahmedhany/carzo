import 'package:carzo/features/brands/data/models/all_brands/all_brands_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class AllBrandsRepo {
  final ApiServices apiServices;

  AllBrandsRepo(this.apiServices);

  Future<ApiResult<List<AllBrandsModel>>> getAllBrands() async {
    try {
      var response = await apiServices.getAllBrands();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
