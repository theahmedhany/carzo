import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/car_showrooms/data/models/showrooms/showrooms_model.dart';
import 'package:carzo/features/car_showrooms/data/repos/showrooms_repo.dart';
import 'package:carzo/features/car_showrooms/manager/showrooms/showrooms_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowroomsCubit extends Cubit<ShowroomsState<List<ShowroomsModel>>> {
  final ShowroomsRepo showroomsRepo;

  ShowroomsCubit(this.showroomsRepo) : super(const Idle());

  void emitGetAllCarShowrooms() async {
    var data = await showroomsRepo.getAllCarShowrooms();

    data.when(
      success: (List<ShowroomsModel> carShowroomsList) {
        emit(ShowroomsState.success(carShowroomsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(ShowroomsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
