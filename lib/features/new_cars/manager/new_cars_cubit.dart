import 'package:bloc/bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/new_car_model.dart';
import '../data/repos/new_cars_repo.dart';
import 'new_cars_state.dart';

class NewCarsCubit extends Cubit<NewCarsState<List<NewCarModel>>> {
  final NewCarsRepo newCarsRepo;

  NewCarsCubit(this.newCarsRepo) : super(const Idle());

  void emitGetAllNewCars(String selectedBrand) async {
    final brandToFetch = selectedBrand == 'ALL' ? '' : selectedBrand;
    emit(const NewCarsState.loading());
    var data = await newCarsRepo.getAllNewCars(brandToFetch);
    data.when(
      success: (List<NewCarModel> newCarsList) {
        emit(NewCarsState.success(newCarsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(NewCarsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
