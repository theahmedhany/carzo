import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/insurance_companies/data/models/insurance_companies_model.dart';
import 'package:carzo/features/insurance_companies/data/repos/insurance_companies_repo.dart';
import 'package:carzo/features/insurance_companies/manager/insurance_companies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
