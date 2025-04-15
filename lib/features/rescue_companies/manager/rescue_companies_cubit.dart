import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/rescue_companies/data/models/rescue_companies_model.dart';
import 'package:carzo/features/rescue_companies/data/repos/rescue_companies_repo.dart';
import 'package:carzo/features/rescue_companies/manager/rescue_companies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RescueCompaniesCubit
    extends Cubit<RescueCompaniesState<List<RescueCompaniesModel>>> {
  final RescueCompaniesRepo rescueCompaniesRepo;

  RescueCompaniesCubit(this.rescueCompaniesRepo) : super(const Idle());

  void emitGetAllRescueCompanies() async {
    var data = await rescueCompaniesRepo.getAllRescueCompanies();

    data.when(
      success: (List<RescueCompaniesModel> rescueCompaniesList) {
        emit(RescueCompaniesState.success(rescueCompaniesList));
      },
      failure: (ApiErrorModel apiError) {
        emit(RescueCompaniesState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
