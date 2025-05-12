import 'package:bloc/bloc.dart';
import 'package:carzo/features/advertisements/data/models/user_advertisements_model.dart';
import 'package:carzo/features/advertisements/data/repos/user_advertisements_repo.dart';
import 'package:carzo/features/advertisements/manager/user_advertisements_state.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';

class UserAdvertisementsCubit
    extends Cubit<UserAdvertisementsState<List<UserAdvertisementsModel>>> {
  final UserAdvertisementsRepo userAdvertisementsRepo;

  UserAdvertisementsCubit(this.userAdvertisementsRepo) : super(const Idle());

  void emitGetUserAdvertisements() async {
    var data = await userAdvertisementsRepo.getUserAdvertisements();

    data.when(
      success: (List<UserAdvertisementsModel> userAdvertisementsList) {
        emit(UserAdvertisementsState.success(userAdvertisementsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          UserAdvertisementsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }

  void emitDeleteUserAdvertisement(String advertisementId) async {
    emit(const UserAdvertisementsState.loading());

    var data = await userAdvertisementsRepo.deleteUserAdvertisement(
      advertisementId,
    );

    data.when(
      success: (_) {
        emitGetUserAdvertisements();
      },
      failure: (ApiErrorModel apiError) {
        emit(
          UserAdvertisementsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }
}
