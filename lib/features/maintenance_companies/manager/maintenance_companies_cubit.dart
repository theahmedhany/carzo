import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/maintenance_companies_model.dart';
import '../data/repos/maintenance_companies_repo.dart';
import 'maintenance_companies_state.dart';

class MaintenanceCompaniesCubit
    extends Cubit<MaintenanceCompaniesState<List<MaintenanceCompaniesModel>>> {
  final MaintenanceCompaniesRepo maintenanceCompaniesRepo;

  MaintenanceCompaniesCubit(this.maintenanceCompaniesRepo)
    : super(const Idle());

  void emitGetAllMaintenanceCompanies() async {
    var data = await maintenanceCompaniesRepo.getAllMaintenanceCompanies();

    data.when(
      success: (List<MaintenanceCompaniesModel> maintenanceCompaniesList) {
        emit(MaintenanceCompaniesState.success(maintenanceCompaniesList));
      },
      failure: (ApiErrorModel errorModel) {
        emit(
          MaintenanceCompaniesState.error(errorModel as ApiNetworkExceptions),
        );
      },
    );
  }
}
