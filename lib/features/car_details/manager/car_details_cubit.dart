import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/car_details_model.dart';
import '../data/repos/car_details_repo.dart';
import 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState<CarDetailsModel>> {
  final CarDetailsRepo carDetailsRepo;

  CarDetailsCubit(this.carDetailsRepo) : super(const Idle());

  void emitGetCarDetails(String carStatus, String carId) async {
    var data = await carDetailsRepo.getCarDetails(carStatus, carId);
    data.when(
      success: (CarDetailsModel carDetails) {
        emit(CarDetailsState.success(carDetails));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          CarDetailsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }

  getCarDetails(String carId) {}
}
