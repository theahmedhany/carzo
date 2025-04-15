import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_personal_car_state.freezed.dart';

@freezed
class SellPersonalCarState<T> with _$SellPersonalCarState<T> {
  const factory SellPersonalCarState.idle() = Idle<T>;
  const factory SellPersonalCarState.loading() = Loading<T>;
  const factory SellPersonalCarState.success(T data) = Success<T>;
  const factory SellPersonalCarState.error({required String error}) = Error<T>;
  const factory SellPersonalCarState.imagesUpdated(int imagesCount) =
      ImagesUpdated<T>;
  const factory SellPersonalCarState.validationError(List<String> errors) =
      ValidationError<T>;
}
