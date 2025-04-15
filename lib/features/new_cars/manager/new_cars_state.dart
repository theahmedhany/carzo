import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_network_exceptions.dart';

part 'new_cars_state.freezed.dart';

@freezed
class NewCarsState<T> with _$NewCarsState<T> {
  const factory NewCarsState.idle() = Idle<T>;

  const factory NewCarsState.loading() = Loading<T>;

  const factory NewCarsState.success(T data) = Success<T>;

  const factory NewCarsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
