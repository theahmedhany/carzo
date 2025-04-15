import '../../../core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cars_state.freezed.dart';

@freezed
class SearchCarsState<T> with _$SearchCarsState<T> {
  const factory SearchCarsState.idle() = Idle<T>;

  const factory SearchCarsState.loading() = Loading<T>;

  const factory SearchCarsState.success(T data) = Success<T>;

  const factory SearchCarsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
