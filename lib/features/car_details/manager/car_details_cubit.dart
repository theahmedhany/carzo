import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/car_details/data/models/car_details_model.dart';
import 'package:carzo/features/car_details/data/repos/car_details_repo.dart';
import 'package:carzo/features/car_details/manager/car_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        emit(CarDetailsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }

  getCarDetails(String carId) {}
}
