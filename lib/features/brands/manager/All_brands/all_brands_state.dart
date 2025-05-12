import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_brands_state.freezed.dart';

@freezed
class AllBrandsState<T> with _$AllBrandsState<T> {
  const factory AllBrandsState.idle() = Idle<T>;

  const factory AllBrandsState.loading() = Loading<T>;

  const factory AllBrandsState.success(T data) = Success<T>;

  const factory AllBrandsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
