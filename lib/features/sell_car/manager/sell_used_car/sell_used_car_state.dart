import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_used_car_state.freezed.dart';

@freezed
class SellUsedCarState<T> with _$SellUsedCarState<T> {
  const factory SellUsedCarState.idle() = Idle<T>;
  const factory SellUsedCarState.loading() = Loading<T>;
  const factory SellUsedCarState.success(T data) = Success<T>;
  const factory SellUsedCarState.error({required String error}) = Error<T>;
  const factory SellUsedCarState.imagesUpdated(int imagesCount) =
      ImagesUpdated<T>;
  const factory SellUsedCarState.validationError(List<String> errors) =
      ValidationError<T>;
}
