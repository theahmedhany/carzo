// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_personal_car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SellPersonalCarState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellPersonalCarStateCopyWith<T, $Res> {
  factory $SellPersonalCarStateCopyWith(
    SellPersonalCarState<T> value,
    $Res Function(SellPersonalCarState<T>) then,
  ) = _$SellPersonalCarStateCopyWithImpl<T, $Res, SellPersonalCarState<T>>;
}

/// @nodoc
class _$SellPersonalCarStateCopyWithImpl<
  T,
  $Res,
  $Val extends SellPersonalCarState<T>
>
    implements $SellPersonalCarStateCopyWith<T, $Res> {
  _$SellPersonalCarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<T, $Res> {
  factory _$$IdleImplCopyWith(
    _$IdleImpl<T> value,
    $Res Function(_$IdleImpl<T>) then,
  ) = __$$IdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<T, $Res>
    extends _$SellPersonalCarStateCopyWithImpl<T, $Res, _$IdleImpl<T>>
    implements _$$IdleImplCopyWith<T, $Res> {
  __$$IdleImplCopyWithImpl(
    _$IdleImpl<T> _value,
    $Res Function(_$IdleImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl<T> implements Idle<T> {
  const _$IdleImpl();

  @override
  String toString() {
    return 'SellPersonalCarState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements SellPersonalCarState<T> {
  const factory Idle() = _$IdleImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl<T> value,
    $Res Function(_$LoadingImpl<T>) then,
  ) = __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$SellPersonalCarStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl<T> _value,
    $Res Function(_$LoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SellPersonalCarState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements SellPersonalCarState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl<T> value,
    $Res Function(_$SuccessImpl<T>) then,
  ) = __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$SellPersonalCarStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl<T> _value,
    $Res Function(_$SuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$SuccessImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SellPersonalCarState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements SellPersonalCarState<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl<T> value,
    $Res Function(_$ErrorImpl<T>) then,
  ) = __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$SellPersonalCarStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl<T> _value,
    $Res Function(_$ErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$ErrorImpl<T>(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SellPersonalCarState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements SellPersonalCarState<T> {
  const factory Error({required final String error}) = _$ErrorImpl<T>;

  String get error;

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagesUpdatedImplCopyWith<T, $Res> {
  factory _$$ImagesUpdatedImplCopyWith(
    _$ImagesUpdatedImpl<T> value,
    $Res Function(_$ImagesUpdatedImpl<T>) then,
  ) = __$$ImagesUpdatedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int imagesCount});
}

/// @nodoc
class __$$ImagesUpdatedImplCopyWithImpl<T, $Res>
    extends _$SellPersonalCarStateCopyWithImpl<T, $Res, _$ImagesUpdatedImpl<T>>
    implements _$$ImagesUpdatedImplCopyWith<T, $Res> {
  __$$ImagesUpdatedImplCopyWithImpl(
    _$ImagesUpdatedImpl<T> _value,
    $Res Function(_$ImagesUpdatedImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imagesCount = null}) {
    return _then(
      _$ImagesUpdatedImpl<T>(
        null == imagesCount
            ? _value.imagesCount
            : imagesCount // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$ImagesUpdatedImpl<T> implements ImagesUpdated<T> {
  const _$ImagesUpdatedImpl(this.imagesCount);

  @override
  final int imagesCount;

  @override
  String toString() {
    return 'SellPersonalCarState<$T>.imagesUpdated(imagesCount: $imagesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesUpdatedImpl<T> &&
            (identical(other.imagesCount, imagesCount) ||
                other.imagesCount == imagesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagesCount);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesUpdatedImplCopyWith<T, _$ImagesUpdatedImpl<T>> get copyWith =>
      __$$ImagesUpdatedImplCopyWithImpl<T, _$ImagesUpdatedImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) {
    return imagesUpdated(imagesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) {
    return imagesUpdated?.call(imagesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (imagesUpdated != null) {
      return imagesUpdated(imagesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) {
    return imagesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) {
    return imagesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (imagesUpdated != null) {
      return imagesUpdated(this);
    }
    return orElse();
  }
}

abstract class ImagesUpdated<T> implements SellPersonalCarState<T> {
  const factory ImagesUpdated(final int imagesCount) = _$ImagesUpdatedImpl<T>;

  int get imagesCount;

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagesUpdatedImplCopyWith<T, _$ImagesUpdatedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<T, $Res> {
  factory _$$ValidationErrorImplCopyWith(
    _$ValidationErrorImpl<T> value,
    $Res Function(_$ValidationErrorImpl<T>) then,
  ) = __$$ValidationErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<T, $Res>
    extends
        _$SellPersonalCarStateCopyWithImpl<T, $Res, _$ValidationErrorImpl<T>>
    implements _$$ValidationErrorImplCopyWith<T, $Res> {
  __$$ValidationErrorImplCopyWithImpl(
    _$ValidationErrorImpl<T> _value,
    $Res Function(_$ValidationErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errors = null}) {
    return _then(
      _$ValidationErrorImpl<T>(
        null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$ValidationErrorImpl<T> implements ValidationError<T> {
  const _$ValidationErrorImpl(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'SellPersonalCarState<$T>.validationError(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl<T> &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<T, _$ValidationErrorImpl<T>> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<T, _$ValidationErrorImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
    required TResult Function(int imagesCount) imagesUpdated,
    required TResult Function(List<String> errors) validationError,
  }) {
    return validationError(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
    TResult? Function(int imagesCount)? imagesUpdated,
    TResult? Function(List<String> errors)? validationError,
  }) {
    return validationError?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    TResult Function(int imagesCount)? imagesUpdated,
    TResult Function(List<String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagesUpdated<T> value) imagesUpdated,
    required TResult Function(ValidationError<T> value) validationError,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult? Function(ValidationError<T> value)? validationError,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagesUpdated<T> value)? imagesUpdated,
    TResult Function(ValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class ValidationError<T> implements SellPersonalCarState<T> {
  const factory ValidationError(final List<String> errors) =
      _$ValidationErrorImpl<T>;

  List<String> get errors;

  /// Create a copy of SellPersonalCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<T, _$ValidationErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
