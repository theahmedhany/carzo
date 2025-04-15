import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_new_car_state.freezed.dart';

@freezed
class SellNewCarState<T> with _$SellNewCarState<T> {
  const factory SellNewCarState.idle() = Idle<T>;
  const factory SellNewCarState.loading() = Loading<T>;
  const factory SellNewCarState.success(T data) = Success<T>;
  const factory SellNewCarState.error({required String error}) = Error<T>;
  const factory SellNewCarState.imagesUpdated(int imagesCount) =
      ImagesUpdated<T>;
  const factory SellNewCarState.validationError(List<String> errors) =
      ValidationError<T>;
}
