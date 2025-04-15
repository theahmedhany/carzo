import 'package:bloc/bloc.dart';
import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/used_cars/data/models/used_car_model.dart';
import 'package:carzo/features/used_cars/data/repos/used_cars_repo.dart';
import 'package:carzo/features/used_cars/manager/used_cars_state.dart';

class UsedCarsCubit extends Cubit<UsedCarsState<List<UsedCarModel>>> {
  final UsedCarsRepo usedCarsRepo;

  UsedCarsCubit(this.usedCarsRepo) : super(const Idle());

  void emitGetAllUsedCars() async {
    var data = await usedCarsRepo.getAllUsedCars();

    data.when(
      success: (List<UsedCarModel> usedCarsList) {
        emit(UsedCarsState.success(usedCarsList));
      },
      failure: (ApiErrorModel errorModel) {
        emit(UsedCarsState.error(errorModel as ApiNetworkExceptions));
      },
    );
  }
}
