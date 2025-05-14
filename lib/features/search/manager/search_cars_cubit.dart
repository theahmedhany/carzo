import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/search_cars_model.dart';
import '../data/repos/search_cars_repo.dart';
import 'search_cars_state.dart';

class SearchCarsCubit extends Cubit<SearchCarsState<List<SearchCarsModel>>> {
  final SearchCarsRepo searchCarsRepo;
  List<SearchCarsModel> allCars = [];

  SearchCarsCubit(this.searchCarsRepo) : super(const Idle()) {
    loadAllCars();
  }

  void loadAllCars() async {
    emit(const SearchCarsState.loading());
    var data = await searchCarsRepo.getCarsBySearch('');

    data.when(
      success: (List<SearchCarsModel> carsList) {
        allCars = carsList;
        emit(SearchCarsState.success(carsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          SearchCarsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }

  void emitGetFilteredCars(String selectedBrand) async {
    final brandToFilter = selectedBrand == 'ALL' ? '' : selectedBrand;
    emit(const SearchCarsState.loading());
    var data = await searchCarsRepo.getCarsBySearch(brandToFilter);

    data.when(
      success: (List<SearchCarsModel> filteredCarsList) {
        allCars = filteredCarsList;
        emit(SearchCarsState.success(filteredCarsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          SearchCarsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }
}
