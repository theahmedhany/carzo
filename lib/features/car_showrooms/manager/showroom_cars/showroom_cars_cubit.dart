import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/car_showrooms/data/models/showroom_cars/showroom_cars_model.dart';
import 'package:carzo/features/car_showrooms/data/repos/showroom_cars_repo.dart';
import 'package:carzo/features/car_showrooms/manager/showroom_cars/showroom_cars_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowroomCarsCubit
    extends Cubit<ShowroomCarsState<List<ShowroomCarsModel>>> {
  final ShowroomCarsRepo showroomCarsRepo;

  ShowroomCarsCubit(this.showroomCarsRepo) : super(const Idle());

  void emitGetCarsByShowroom(String showroomId) async {
    var data = await showroomCarsRepo.getCarsByShowroom(showroomId);
    data.when(
      success: (List<ShowroomCarsModel> showroomCarsList) {
        emit(ShowroomCarsState.success(showroomCarsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(ShowroomCarsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
