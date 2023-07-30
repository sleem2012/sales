// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiClientState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(KFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(KFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(KFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiClientStateInitial value) initial,
    required TResult Function(ApiClientStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiClientStateInitial value)? initial,
    TResult? Function(ApiClientStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiClientStateInitial value)? initial,
    TResult Function(ApiClientStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiClientStateCopyWith<$Res> {
  factory $ApiClientStateCopyWith(
          ApiClientState value, $Res Function(ApiClientState) then) =
      _$ApiClientStateCopyWithImpl<$Res, ApiClientState>;
}

/// @nodoc
class _$ApiClientStateCopyWithImpl<$Res, $Val extends ApiClientState>
    implements $ApiClientStateCopyWith<$Res> {
  _$ApiClientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ApiClientStateInitialCopyWith<$Res> {
  factory _$$ApiClientStateInitialCopyWith(_$ApiClientStateInitial value,
          $Res Function(_$ApiClientStateInitial) then) =
      __$$ApiClientStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ApiClientStateInitialCopyWithImpl<$Res>
    extends _$ApiClientStateCopyWithImpl<$Res, _$ApiClientStateInitial>
    implements _$$ApiClientStateInitialCopyWith<$Res> {
  __$$ApiClientStateInitialCopyWithImpl(_$ApiClientStateInitial _value,
      $Res Function(_$ApiClientStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ApiClientStateInitial implements ApiClientStateInitial {
  const _$ApiClientStateInitial();

  @override
  String toString() {
    return 'ApiClientState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApiClientStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(KFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(KFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(KFailure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiClientStateInitial value) initial,
    required TResult Function(ApiClientStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiClientStateInitial value)? initial,
    TResult? Function(ApiClientStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiClientStateInitial value)? initial,
    TResult Function(ApiClientStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ApiClientStateInitial implements ApiClientState {
  const factory ApiClientStateInitial() = _$ApiClientStateInitial;
}

/// @nodoc
abstract class _$$ApiClientStateErrorCopyWith<$Res> {
  factory _$$ApiClientStateErrorCopyWith(_$ApiClientStateError value,
          $Res Function(_$ApiClientStateError) then) =
      __$$ApiClientStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure failure});

  $KFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ApiClientStateErrorCopyWithImpl<$Res>
    extends _$ApiClientStateCopyWithImpl<$Res, _$ApiClientStateError>
    implements _$$ApiClientStateErrorCopyWith<$Res> {
  __$$ApiClientStateErrorCopyWithImpl(
      _$ApiClientStateError _value, $Res Function(_$ApiClientStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ApiClientStateError(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as KFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $KFailureCopyWith<$Res> get failure {
    return $KFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ApiClientStateError implements ApiClientStateError {
  const _$ApiClientStateError({required this.failure});

  @override
  final KFailure failure;

  @override
  String toString() {
    return 'ApiClientState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiClientStateError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiClientStateErrorCopyWith<_$ApiClientStateError> get copyWith =>
      __$$ApiClientStateErrorCopyWithImpl<_$ApiClientStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(KFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(KFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(KFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiClientStateInitial value) initial,
    required TResult Function(ApiClientStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiClientStateInitial value)? initial,
    TResult? Function(ApiClientStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiClientStateInitial value)? initial,
    TResult Function(ApiClientStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiClientStateError implements ApiClientState {
  const factory ApiClientStateError({required final KFailure failure}) =
      _$ApiClientStateError;

  KFailure get failure;
  @JsonKey(ignore: true)
  _$$ApiClientStateErrorCopyWith<_$ApiClientStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
