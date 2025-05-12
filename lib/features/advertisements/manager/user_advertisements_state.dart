import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_network_exceptions.dart';

part 'user_advertisements_state.freezed.dart';

@freezed
class UserAdvertisementsState<T> with _$UserAdvertisementsState<T> {
  const factory UserAdvertisementsState.idle() = Idle<T>;

  const factory UserAdvertisementsState.loading() = Loading<T>;

  const factory UserAdvertisementsState.success(T data) = Success<T>;

  const factory UserAdvertisementsState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
