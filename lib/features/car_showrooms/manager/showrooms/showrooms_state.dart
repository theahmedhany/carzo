import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'showrooms_state.freezed.dart';

@freezed
class ShowroomsState<T> with _$ShowroomsState<T> {
  const factory ShowroomsState.idle() = Idle<T>;

  const factory ShowroomsState.loading() = Loading<T>;

  const factory ShowroomsState.success(T data) = Success<T>;

  const factory ShowroomsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
