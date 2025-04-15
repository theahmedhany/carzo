import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_cars_state.freezed.dart';

@freezed
class BrandCarsState<T> with _$BrandCarsState<T> {
  const factory BrandCarsState.idle() = Idle<T>;
  const factory BrandCarsState.loading() = Loading<T>;
  const factory BrandCarsState.success(T data) = Success<T>;
  const factory BrandCarsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
