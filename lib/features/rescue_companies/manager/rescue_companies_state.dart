import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rescue_companies_state.freezed.dart';

@freezed
class RescueCompaniesState<T> with _$RescueCompaniesState<T> {
  const factory RescueCompaniesState.idle() = Idle<T>;

  const factory RescueCompaniesState.loading() = Loading<T>;

  const factory RescueCompaniesState.success(T data) = Success<T>;

  const factory RescueCompaniesState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
