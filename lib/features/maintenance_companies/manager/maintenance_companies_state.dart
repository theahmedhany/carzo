import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_companies_state.freezed.dart';

@freezed
class MaintenanceCompaniesState<T> with _$MaintenanceCompaniesState<T> {
  const factory MaintenanceCompaniesState.idle() = Idle<T>;

  const factory MaintenanceCompaniesState.loading() = Loading<T>;

  const factory MaintenanceCompaniesState.success(T data) = Success<T>;

  const factory MaintenanceCompaniesState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
