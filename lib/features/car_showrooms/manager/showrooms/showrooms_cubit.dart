import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/showrooms/showrooms_model.dart';
import '../../data/repos/showrooms_repo.dart';
import 'showrooms_state.dart';

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
        emit(
          ShowroomsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }
}
