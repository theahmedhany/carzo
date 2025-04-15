import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_cars_state.freezed.dart';

@freezed
class AllCarsState<T> with _$AllCarsState<T> {
  const factory AllCarsState.idle() = Idle<T>;

  const factory AllCarsState.loading() = Loading<T>;

  const factory AllCarsState.success(T data) = Success<T>;

  const factory AllCarsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
