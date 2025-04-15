import 'package:carzo/core/di/dependency_injection.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/widgets/privacy_policy_view.dart';
import 'package:carzo/features/brands/data/repos/brand_cars_repo.dart';
import 'package:carzo/features/brands/manager/brand_cars_cubit.dart';
import 'package:carzo/features/brands/presentation/views/brands_cars_view.dart';
import 'package:carzo/features/car_details/data/repos/car_details_repo.dart';
import 'package:carzo/features/car_details/manager/car_details_cubit.dart';
import 'package:carzo/features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import 'package:carzo/features/car_showrooms/data/repos/showroom_cars_repo.dart';
import 'package:carzo/features/car_showrooms/data/repos/showrooms_repo.dart';
import 'package:carzo/features/car_showrooms/manager/showroom_cars/showroom_cars_cubit.dart';
import 'package:carzo/features/car_showrooms/manager/showrooms/showrooms_cubit.dart';
import 'package:carzo/features/insurance_companies/data/models/insurance_companies_model.dart';
import 'package:carzo/features/insurance_companies/data/repos/insurance_companies_repo.dart';
import 'package:carzo/features/insurance_companies/manager/insurance_companies_cubit.dart';
import 'package:carzo/features/insurance_companies/presentation/views/insurance_companies_details_view.dart';
import 'package:carzo/features/insurance_companies/presentation/views/insurance_companies_view.dart';
import 'package:carzo/features/login_and_signup/manager/login/login_cubit.dart';
import 'package:carzo/features/login_and_signup/manager/signup/signup_cubit.dart';
import 'package:carzo/features/maintenance_companies/data/models/maintenance_companies_model.dart';
import 'package:carzo/features/maintenance_companies/data/repos/maintenance_companies_repo.dart';
import 'package:carzo/features/maintenance_companies/manager/maintenance_companies_cubit.dart';
import 'package:carzo/features/maintenance_companies/presentation/views/maintenance_companies_details_view.dart';
import 'package:carzo/features/maintenance_companies/presentation/views/maintenance_companies_view.dart';
import 'package:carzo/features/new_cars/data/repos/new_cars_repo.dart';
import 'package:carzo/features/new_cars/manager/new_cars_cubit.dart';
import 'package:carzo/features/new_cars/presentation/views/new_cars_view.dart';
import 'package:carzo/features/recommend_for_you/data/repos/all_cars_repo.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_cubit.dart';
import 'package:carzo/features/rescue_companies/data/models/rescue_companies_model.dart';
import 'package:carzo/features/rescue_companies/data/repos/rescue_companies_repo.dart';
import 'package:carzo/features/rescue_companies/manager/rescue_companies_cubit.dart';
import 'package:carzo/features/rescue_companies/presentation/views/rescue_companies_details_view.dart';
import 'package:carzo/features/rescue_companies/presentation/views/rescue_companies_view.dart';
import 'package:carzo/features/search/data/repos/search_cars_repo.dart';
import 'package:carzo/features/search/manager/search_cars_cubit.dart';
import 'package:carzo/features/sell_car/manager/sell_new_car/sell_new_car_cubit.dart';
import 'package:carzo/features/sell_car/manager/sell_personal_car/sell_personal_car_cubit.dart';
import 'package:carzo/features/sell_car/manager/sell_used_car/sell_used_car_cubit.dart';
import 'package:carzo/features/sell_car/presentation/views/sell_personal_car_view.dart';
import 'package:carzo/features/sell_car/presentation/views/sell_used_car_view.dart';
import 'package:carzo/features/used_cars/data/repos/used_cars_repo.dart';
import 'package:carzo/features/used_cars/manager/used_cars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/brands/presentation/views/brands_view.dart';
import '../../features/car_details/presentation/views/car_details_view.dart';
import '../../features/car_showrooms/presentation/views/car_showrooms_details_view.dart';
import '../../features/car_showrooms/presentation/views/full_car_showrooms_view.dart';
import '../../features/chat/data/services/gemini_service.dart';
import '../../features/chat/manager/chat_cubit.dart';
import '../../features/chat/presentation/views/help_support_chat_view.dart';
import '../../features/chat/presentation/views/master_chat_view.dart';
import '../../features/favorite/presentation/views/favorite_view.dart';
import '../../features/get_started/presentation/views/get_started_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/login_and_signup/presentation/views/login_view.dart';
import '../../features/login_and_signup/presentation/views/signup_view.dart';
import '../../features/notifications/presentation/views/notifications_view.dart';
import '../../features/our_services/presentation/views/our_services_view.dart';
import '../../features/recommend_for_you/presentation/views/recommend_for_you_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/sell_car/presentation/views/sell_car_view.dart';
import '../../features/sell_car/presentation/views/sell_new_cars_view.dart';
import '../../features/used_cars/presentation/views/used_cars_view.dart';
import '../../features/user/presentation/views/edit_profile_view.dart';
import '../../features/user/presentation/views/personal_details_view.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Get Started View
      case Routes.getStartedView:
        return MaterialPageRoute(builder: (_) => GetStartedView());

      // Home View
      case Routes.homeView:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            AllCarsCubit(getIt<AllCarsRepo>())
                              ..emitGetAllCars(),
                  ),

                  BlocProvider(
                    create:
                        (context) =>
                            SearchCarsCubit(getIt<SearchCarsRepo>())
                              ..emitGetFilteredCars(filterSearchByBrand),
                  ),
                ],
                child: HomeView(),
              ),
        );

      // Notifications View
      case Routes.notificationsView:
        return MaterialPageRoute(builder: (_) => const NotificationsView());

      // Our Services View
      case Routes.ourServicesView:
        return MaterialPageRoute(builder: (_) => OurServicesView());

      // Brands View
      case Routes.brandsView:
        return MaterialPageRoute(builder: (_) => BrandsView());

      // Recommend For You View
      case Routes.recommendForYouView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        AllCarsCubit(getIt<AllCarsRepo>())..emitGetAllCars(),
                child: RecommendForYouView(),
              ),
        );

      // Used Cars View
      case Routes.usedCarsView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        UsedCarsCubit(getIt<UsedCarsRepo>())
                          ..emitGetAllUsedCars(),
                child: UsedCarsView(),
              ),
        );

      // New Cars View
      case Routes.newCarsView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        NewCarsCubit(getIt<NewCarsRepo>())
                          ..emitGetAllNewCars(newCarsBrandName),
                child: NewCarsView(),
              ),
        );

      // Car Details View
      case Routes.carDetailsView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        CarDetailsCubit(getIt<CarDetailsRepo>())
                          ..emitGetCarDetails(carDetailsStatus, carDetailsId),
                child: CarDetailsView(
                  carId: carDetailsId,
                  carStatus: carDetailsStatus,
                ),
              ),
        );

      // Search View
      case Routes.searchView:
        return MaterialPageRoute(builder: (_) => SearchView());

      // Favorite View
      case Routes.favoriteView:
        return MaterialPageRoute(builder: (_) => const FavoriteView());

      // Signup View
      case Routes.signupView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: SignupView(),
              ),
        );

      // Login View
      case Routes.loginView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginView(),
              ),
        );

      // Personal Details View
      case Routes.personalDetailsView:
        return MaterialPageRoute(builder: (_) => PersonalDetailsView());

      // Edit Profile View
      case Routes.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());

      // Master Chat View
      case Routes.masterChatView:
        return MaterialPageRoute(builder: (_) => const MasterChatView());

      // Chat View
      case Routes.helpSupportChatView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => ChatCubit(GeminiService()),
                child: const HelpSupportChatView(),
              ),
        );

      // Sell Car View
      case Routes.sellCarView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        AllCarsCubit(getIt<AllCarsRepo>())..emitGetAllCars(),
                child: SellCarView(),
              ),
        );

      // Sell New Cars View
      case Routes.sellNewCarsView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SellNewCarCubit>(),
                child: SellNewCarsView(),
              ),
        );

      // Sell Used Cars View
      case Routes.sellUsedCarView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SellUsedCarCubit>(),
                child: SellUsedCarView(),
              ),
        );

      // Sell Personal Car View
      case Routes.sellPersonalCarView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SellPersonalCarCubit>(),
                child: SellPersonalCarView(),
              ),
        );

      // Full Car Showrooms View
      case Routes.fullCarShowroomsView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        ShowroomsCubit(getIt<ShowroomsRepo>())
                          ..emitGetAllCarShowrooms(),
                child: FullCarShowroomsView(),
              ),
        );

      // Car Showrooms Details View
      case Routes.carShowroomsDetailsView:
        final company = settings.arguments as ShowroomsModel;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        ShowroomCarsCubit(getIt<ShowroomCarsRepo>())
                          ..emitGetCarsByShowroom(company.id.toString()),
                child: CarShowroomsDetailsView(company: company),
              ),
        );

      // Insurance Companies View
      case Routes.insuranceCompaniesView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        InsuranceCompaniesCubit(getIt<InsuranceCompaniesRepo>())
                          ..emitGetAllInsuranceCompanies(),
                child: InsuranceCompaniesView(),
              ),
        );

      // Insurance Companies Details View
      case Routes.insuranceCompaniesDetailsView:
        final company = settings.arguments as InsuranceCompaniesModel;
        return MaterialPageRoute(
          builder: (_) => InsuranceCompaniesDetailsView(company: company),
        );

      // Maintenance Companies View
      case Routes.maintenanceCompaniesView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => MaintenanceCompaniesCubit(
                      getIt<MaintenanceCompaniesRepo>(),
                    )..emitGetAllMaintenanceCompanies(),
                child: MaintenanceCompaniesView(),
              ),
        );

      // Maintenance Companies Details View
      case Routes.maintenanceCompaniesDetailsView:
        final company = settings.arguments as MaintenanceCompaniesModel;
        return MaterialPageRoute(
          builder: (_) => MaintenanceCompaniesDetailsView(company: company),
        );

      // Rescue Companies View
      case Routes.rescueCompaniesView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        RescueCompaniesCubit(getIt<RescueCompaniesRepo>())
                          ..emitGetAllRescueCompanies(),
                child: RescueCompaniesView(),
              ),
        );

      // Rescue Companies Details View
      case Routes.rescueCompaniesDetailsView:
        final company = settings.arguments as RescueCompaniesModel;
        return MaterialPageRoute(
          builder: (_) => RescueCompaniesDetailsView(company: company),
        );

      // Brands Cars View
      case Routes.brandsCarsView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        BrandCarsCubit(getIt<BrandCarsRepo>())
                          ..emitGetAllBrandCars(masterBrandName),
                child: BrandsCarsView(brandName: masterBrandName),
              ),
        );

      // Privacy Policy View
      case Routes.privacyPolicyView:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());

      default:
        return null;
    }
  }
}
