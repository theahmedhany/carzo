import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_details_state.freezed.dart';

@freezed
class CarDetailsState<T> with _$CarDetailsState<T> {
  const factory CarDetailsState.idle() = Idle<T>;

  const factory CarDetailsState.loading() = Loading<T>;

  const factory CarDetailsState.success(T data) = Success<T>;

  const factory CarDetailsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
