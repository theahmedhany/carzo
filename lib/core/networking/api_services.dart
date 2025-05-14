import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/advertisements/data/models/user_advertisements_model.dart';
import '../../features/brands/data/models/all_brands/all_brands_model.dart';
import '../../features/brands/data/models/brand_cars/brand_cars_model.dart';
import '../../features/car_details/data/models/car_details_model.dart';
import '../../features/car_showrooms/data/models/showroom_cars/showroom_cars_model.dart';
import '../../features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import '../../features/insurance_companies/data/models/insurance_companies_model.dart';
import '../../features/login_and_signup/data/models/login/login_request_body.dart';
import '../../features/login_and_signup/data/models/login/login_response.dart';
import '../../features/login_and_signup/data/models/signup/signup_request_body.dart';
import '../../features/login_and_signup/data/models/signup/signup_response.dart';
import '../../features/maintenance_companies/data/models/maintenance_companies_model.dart';
import '../../features/new_cars/data/models/new_car_model.dart';
import '../../features/recommend_for_you/data/models/all_cars_model.dart';
import '../../features/rescue_companies/data/models/rescue_companies_model.dart';
import '../../features/search/data/models/search_cars_model.dart';
import '../../features/sell_car/data/models/sell_new_car/sell_new_car_response.dart';
import '../../features/sell_car/data/models/sell_personal_car/sell_personal_car_response.dart';
import '../../features/sell_car/data/models/sell_used_car/sell_used_car_response.dart';
import '../../features/used_cars/data/models/used_car_model.dart';
import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Used Cars API
  @GET(ApiConstants.apiUsedCars)
  Future<List<UsedCarModel>> getAllUsedCars();

  // New Cars API
  @GET('${ApiConstants.apiNewCars}/{brandName}')
  Future<List<NewCarModel>> getAllNewCars(@Path('brandName') String brandName);

  // All Cars API
  @GET(ApiConstants.apiAllCars)
  Future<List<AllCarsModel>> getAllCars();

  // Brands API
  @GET('${ApiConstants.apiBrandCars}/{brandName}')
  Future<List<BrandCarsModel>> getCarsByBrand(
    @Path('brandName') String brandName,
  );

  // All Brands API
  @GET(ApiConstants.apiAllBrand)
  Future<List<AllBrandsModel>> getAllBrands();

  // Search Cars API
  @GET('${ApiConstants.apiSearchCars}/{brandName}')
  Future<List<SearchCarsModel>> getCarsBySearch(
    @Path('brandName') String brandName,
  );

  // Insurance Companies API
  @GET(ApiConstants.apiInsuranceCompanies)
  Future<List<InsuranceCompaniesModel>> getAllInsuranceCompanies();

  // Maintenance Companies API
  @GET(ApiConstants.apiMaintenanceCompanies)
  Future<List<MaintenanceCompaniesModel>> getAllMaintenanceCompanies();

  // Rescue Companies API
  @GET(ApiConstants.apiRescueCompanies)
  Future<List<RescueCompaniesModel>> getAllRescueCompanies();

  // Car Showrooms API
  @GET(ApiConstants.apiCarShowrooms)
  Future<List<ShowroomsModel>> getAllCarShowrooms();

  // Car Showroom Cars API
  @GET('${ApiConstants.apiAllShowroomCars}={showroomId}')
  Future<List<ShowroomCarsModel>> getCarsByShowroom(
    @Path('showroomId') String showroomId,
  );

  // Car Details API
  @GET('${ApiConstants.apiCarsDetails}/{carStatus}/{carId}')
  Future<CarDetailsModel> getCarDetails(
    @Path('carStatus') String carStatus,
    @Path('carId') String carId,
  );

  // User Advertisements API
  @GET(ApiConstants.apiUserAdvertisements)
  Future<List<UserAdvertisementsModel>> getUserAdvertisements();

  @DELETE('${ApiConstants.apiDeleteUserAdvertisement}/{id}')
  Future<HttpResponse> deleteUserAdvertisement(@Path('id') String userId);

  // Sell New Car API
  @POST(ApiConstants.apiSellNewCar)
  @MultiPart()
  Future<SellNewCarResponse> sellNewCar(@Body() FormData formData);

  // Sell Used Car API
  @POST(ApiConstants.apiSellUsedCar)
  @MultiPart()
  Future<SellUsedCarResponse> sellUsedCar(@Body() FormData formData);

  // Sell Personal Car API
  @POST(ApiConstants.apiSellPersonalCar)
  @MultiPart()
  Future<SellPersonalCarResponse> sellPersonalCar(@Body() FormData formData);

  // Login API
  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Signup API
  @POST(ApiConstants.apiSignup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
