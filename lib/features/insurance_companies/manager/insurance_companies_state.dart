import '../../../core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_companies_state.freezed.dart';

@freezed
class InsuranceCompaniesState<T> with _$InsuranceCompaniesState<T> {
  const factory InsuranceCompaniesState.idle() = Idle<T>;

  const factory InsuranceCompaniesState.loading() = Loading<T>;

  const factory InsuranceCompaniesState.success(T data) = Success<T>;

  const factory InsuranceCompaniesState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
