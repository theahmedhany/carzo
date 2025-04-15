import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/brands/data/repos/brand_cars_repo.dart';
import '../../features/brands/manager/brand_cars_cubit.dart';
import '../../features/car_details/data/repos/car_details_repo.dart';
import '../../features/car_details/manager/car_details_cubit.dart';
import '../../features/car_showrooms/data/repos/showroom_cars_repo.dart';
import '../../features/car_showrooms/data/repos/showrooms_repo.dart';
import '../../features/car_showrooms/manager/showroom_cars/showroom_cars_cubit.dart';
import '../../features/car_showrooms/manager/showrooms/showrooms_cubit.dart';
import '../../features/insurance_companies/data/repos/insurance_companies_repo.dart';
import '../../features/insurance_companies/manager/insurance_companies_cubit.dart';
import '../../features/login_and_signup/data/repos/login_repo.dart';
import '../../features/login_and_signup/data/repos/signup_repo.dart';
import '../../features/login_and_signup/manager/login/login_cubit.dart';
import '../../features/login_and_signup/manager/signup/signup_cubit.dart';
import '../../features/maintenance_companies/data/repos/maintenance_companies_repo.dart';
import '../../features/maintenance_companies/manager/maintenance_companies_cubit.dart';
import '../../features/new_cars/data/repos/new_cars_repo.dart';
import '../../features/new_cars/manager/new_cars_cubit.dart';
import '../../features/recommend_for_you/data/repos/all_cars_repo.dart';
import '../../features/recommend_for_you/manager/all_cars_cubit.dart';
import '../../features/rescue_companies/data/repos/rescue_companies_repo.dart';
import '../../features/rescue_companies/manager/rescue_companies_cubit.dart';
import '../../features/search/data/repos/search_cars_repo.dart';
import '../../features/search/manager/search_cars_cubit.dart';
import '../../features/sell_car/data/repos/sell_new_car_repo.dart';
import '../../features/sell_car/data/repos/sell_personal_car_repo.dart';
import '../../features/sell_car/data/repos/sell_used_car_repo.dart';
import '../../features/sell_car/manager/sell_new_car/sell_new_car_cubit.dart';
import '../../features/sell_car/manager/sell_personal_car/sell_personal_car_cubit.dart';
import '../../features/sell_car/manager/sell_used_car/sell_used_car_cubit.dart';
import '../../features/used_cars/data/repos/used_cars_repo.dart';
import '../../features/used_cars/manager/used_cars_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Used Cars
  getIt.registerLazySingleton<UsedCarsRepo>(
    () => UsedCarsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<UsedCarsCubit>(
    () => UsedCarsCubit(getIt<UsedCarsRepo>()),
  );

  // New Cars
  getIt.registerLazySingleton<NewCarsRepo>(
    () => NewCarsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<NewCarsCubit>(() => NewCarsCubit(getIt<NewCarsRepo>()));

  // All Cars
  getIt.registerLazySingleton<AllCarsRepo>(
    () => AllCarsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<AllCarsCubit>(() => AllCarsCubit(getIt<AllCarsRepo>()));

  // Brand Cars
  getIt.registerLazySingleton<BrandCarsRepo>(
    () => BrandCarsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<BrandCarsCubit>(
    () => BrandCarsCubit(getIt<BrandCarsRepo>()),
  );

  // Search Cars
  getIt.registerLazySingleton<SearchCarsRepo>(
    () => SearchCarsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<SearchCarsCubit>(
    () => SearchCarsCubit(getIt<SearchCarsRepo>()),
  );

  // Insurance Companies
  getIt.registerLazySingleton<InsuranceCompaniesRepo>(
    () => InsuranceCompaniesRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<InsuranceCompaniesCubit>(
    () => InsuranceCompaniesCubit(getIt<InsuranceCompaniesRepo>()),
  );

  // Maintenance Companies
  getIt.registerLazySingleton<MaintenanceCompaniesRepo>(
    () => MaintenanceCompaniesRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<MaintenanceCompaniesCubit>(
    () => MaintenanceCompaniesCubit(getIt<MaintenanceCompaniesRepo>()),
  );

  // Rescue Companies
  getIt.registerLazySingleton<RescueCompaniesRepo>(
    () => RescueCompaniesRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<RescueCompaniesCubit>(
    () => RescueCompaniesCubit(getIt<RescueCompaniesRepo>()),
  );

  // Car Showrooms
  getIt.registerLazySingleton<ShowroomsRepo>(
    () => ShowroomsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<ShowroomsCubit>(
    () => ShowroomsCubit(getIt<ShowroomsRepo>()),
  );

  // Showroom Cars
  getIt.registerLazySingleton<ShowroomCarsRepo>(
    () => ShowroomCarsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<ShowroomCarsCubit>(
    () => ShowroomCarsCubit(getIt<ShowroomCarsRepo>()),
  );

  // Car Details
  getIt.registerLazySingleton<CarDetailsRepo>(
    () => CarDetailsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<CarDetailsCubit>(
    () => CarDetailsCubit(getIt<CarDetailsRepo>()),
  );

  // Sell New Car
  getIt.registerLazySingleton<SellNewCarRepo>(() => SellNewCarRepo(getIt()));
  getIt.registerFactory<SellNewCarCubit>(
    () => SellNewCarCubit(getIt<SellNewCarRepo>()),
  );

  // Sell Used Car
  getIt.registerLazySingleton<SellUsedCarRepo>(() => SellUsedCarRepo(getIt()));
  getIt.registerFactory<SellUsedCarCubit>(
    () => SellUsedCarCubit(getIt<SellUsedCarRepo>()),
  );

  // Sell Personal Car
  getIt.registerLazySingleton<SellPersonalCarRepo>(
    () => SellPersonalCarRepo(getIt()),
  );
  getIt.registerFactory<SellPersonalCarCubit>(
    () => SellPersonalCarCubit(getIt<SellPersonalCarRepo>()),
  );

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
