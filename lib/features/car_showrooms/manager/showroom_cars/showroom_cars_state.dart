import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'showroom_cars_state.freezed.dart';

@freezed
class ShowroomCarsState<T> with _$ShowroomCarsState<T> {
  const factory ShowroomCarsState.idle() = Idle<T>;

  const factory ShowroomCarsState.loading() = Loading<T>;

  const factory ShowroomCarsState.success(T data) = Success<T>;

  const factory ShowroomCarsState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
