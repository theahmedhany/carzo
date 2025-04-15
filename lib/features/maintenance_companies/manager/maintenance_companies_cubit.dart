import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/maintenance_companies/data/models/maintenance_companies_model.dart';
import 'package:carzo/features/maintenance_companies/data/repos/maintenance_companies_repo.dart';
import 'package:carzo/features/maintenance_companies/manager/maintenance_companies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
