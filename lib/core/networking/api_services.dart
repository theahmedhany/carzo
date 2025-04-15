import 'package:carzo/core/networking/api_constants.dart';
import 'package:carzo/features/brands/data/models/brand_cars_model.dart';
import 'package:carzo/features/car_details/data/models/car_details_model.dart';
import 'package:carzo/features/car_showrooms/data/models/showroom_cars/showroom_cars_model.dart';
import 'package:carzo/features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import 'package:carzo/features/insurance_companies/data/models/insurance_companies_model.dart';
import 'package:carzo/features/login_and_signup/data/models/login/login_request_body.dart';
import 'package:carzo/features/login_and_signup/data/models/login/login_response.dart';
import 'package:carzo/features/login_and_signup/data/models/signup/signup_request_body.dart';
import 'package:carzo/features/login_and_signup/data/models/signup/signup_response.dart';
import 'package:carzo/features/maintenance_companies/data/models/maintenance_companies_model.dart';
import 'package:carzo/features/new_cars/data/models/new_car_model.dart';
import 'package:carzo/features/recommend_for_you/data/models/all_cars_model.dart';
import 'package:carzo/features/rescue_companies/data/models/rescue_companies_model.dart';
import 'package:carzo/features/search/data/models/search_cars_model.dart';
import 'package:carzo/features/sell_car/data/models/sell_new_car/sell_new_car_response.dart';
import 'package:carzo/features/sell_car/data/models/sell_personal_car/sell_personal_car_response.dart';
import 'package:carzo/features/sell_car/data/models/sell_used_car/sell_used_car_response.dart';
import 'package:carzo/features/used_cars/data/models/used_car_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET(ApiConstants.apiUsedCars)
  Future<List<UsedCarModel>> getAllUsedCars();

  @GET('${ApiConstants.apiNewCars}/{brandName}')
  Future<List<NewCarModel>> getAllNewCars(@Path('brandName') String brandName);

  @GET(ApiConstants.apiAllCars)
  Future<List<AllCarsModel>> getAllCars();

  @GET('${ApiConstants.apiBrandCars}/{brandName}')
  Future<List<BrandCarsModel>> getCarsByBrand(
    @Path('brandName') String brandName,
  );

  @GET('${ApiConstants.apiSearchCars}/{brandName}')
  Future<List<SearchCarsModel>> getCarsBySearch(
    @Path('brandName') String brandName,
  );

  @GET(ApiConstants.apiInsuranceCompanies)
  Future<List<InsuranceCompaniesModel>> getAllInsuranceCompanies();

  @GET(ApiConstants.apiMaintenanceCompanies)
  Future<List<MaintenanceCompaniesModel>> getAllMaintenanceCompanies();

  @GET(ApiConstants.apiRescueCompanies)
  Future<List<RescueCompaniesModel>> getAllRescueCompanies();

  @GET(ApiConstants.apiCarShowrooms)
  Future<List<ShowroomsModel>> getAllCarShowrooms();

  @GET('${ApiConstants.apiAllShowroomCars}={showroomId}')
  Future<List<ShowroomCarsModel>> getCarsByShowroom(
    @Path('showroomId') String showroomId,
  );

  @GET('${ApiConstants.apiCarsDetails}/{carStatus}/{carId}')
  Future<CarDetailsModel> getCarDetails(
    @Path('carStatus') String carStatus,
    @Path('carId') String carId,
  );

  @POST(ApiConstants.apiSellNewCar)
  @MultiPart()
  Future<SellNewCarResponse> sellNewCar(@Body() FormData formData);

  @POST(ApiConstants.apiSellUsedCar)
  @MultiPart()
  Future<SellUsedCarResponse> sellUsedCar(@Body() FormData formData);

  @POST(ApiConstants.apiSellPersonalCar)
  @MultiPart()
  Future<SellPersonalCarResponse> sellPersonalCar(@Body() FormData formData);

  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.apiSignup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
