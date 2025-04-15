import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/insurance_companies_model.dart';
import '../data/repos/insurance_companies_repo.dart';
import 'insurance_companies_state.dart';

class InsuranceCompaniesCubit
    extends Cubit<InsuranceCompaniesState<List<InsuranceCompaniesModel>>> {
  final InsuranceCompaniesRepo insuranceCompaniesRepo;

  InsuranceCompaniesCubit(this.insuranceCompaniesRepo) : super(const Idle());

  void emitGetAllInsuranceCompanies() async {
    var data = await insuranceCompaniesRepo.getAllInsuranceCompanies();

    data.when(
      success: (List<InsuranceCompaniesModel> insuranceCompaniesList) {
        emit(InsuranceCompaniesState.success(insuranceCompaniesList));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          InsuranceCompaniesState.error(apiErrorModel as ApiNetworkExceptions),
        );
      },
    );
  }
}
