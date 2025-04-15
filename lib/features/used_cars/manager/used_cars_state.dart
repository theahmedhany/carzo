import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'used_cars_state.freezed.dart';

@freezed
class UsedCarsState<T> with _$UsedCarsState<T> {
  const factory UsedCarsState.idle() = Idle<T>;

  const factory UsedCarsState.loading() = Loading<T>;

  const factory UsedCarsState.success(T data) = Success<T>;

  const factory UsedCarsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
