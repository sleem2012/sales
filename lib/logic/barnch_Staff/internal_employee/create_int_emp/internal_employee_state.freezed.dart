// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internal_employee_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InternalEmployeeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternalEmployeeStateInitial value) initial,
    required TResult Function(InternalEmployeeStateLoading value) loading,
    required TResult Function(InternalEmployeeStateSuccess value) success,
    required TResult Function(InternalEmployeeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalEmployeeStateInitial value)? initial,
    TResult? Function(InternalEmployeeStateLoading value)? loading,
    TResult? Function(InternalEmployeeStateSuccess value)? success,
    TResult? Function(InternalEmployeeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalEmployeeStateInitial value)? initial,
    TResult Function(InternalEmployeeStateLoading value)? loading,
    TResult Function(InternalEmployeeStateSuccess value)? success,
    TResult Function(InternalEmployeeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternalEmployeeStateCopyWith<$Res> {
  factory $InternalEmployeeStateCopyWith(InternalEmployeeState value,
          $Res Function(InternalEmployeeState) then) =
      _$InternalEmployeeStateCopyWithImpl<$Res, InternalEmployeeState>;
}

/// @nodoc
class _$InternalEmployeeStateCopyWithImpl<$Res,
        $Val extends InternalEmployeeState>
    implements $InternalEmployeeStateCopyWith<$Res> {
  _$InternalEmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InternalEmployeeStateInitialCopyWith<$Res> {
  factory _$$InternalEmployeeStateInitialCopyWith(
          _$InternalEmployeeStateInitial value,
          $Res Function(_$InternalEmployeeStateInitial) then) =
      __$$InternalEmployeeStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternalEmployeeStateInitialCopyWithImpl<$Res>
    extends _$InternalEmployeeStateCopyWithImpl<$Res,
        _$InternalEmployeeStateInitial>
    implements _$$InternalEmployeeStateInitialCopyWith<$Res> {
  __$$InternalEmployeeStateInitialCopyWithImpl(
      _$InternalEmployeeStateInitial _value,
      $Res Function(_$InternalEmployeeStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternalEmployeeStateInitial implements InternalEmployeeStateInitial {
  const _$InternalEmployeeStateInitial();

  @override
  String toString() {
    return 'InternalEmployeeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalEmployeeStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(InternalEmployeeStateInitial value) initial,
    required TResult Function(InternalEmployeeStateLoading value) loading,
    required TResult Function(InternalEmployeeStateSuccess value) success,
    required TResult Function(InternalEmployeeStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalEmployeeStateInitial value)? initial,
    TResult? Function(InternalEmployeeStateLoading value)? loading,
    TResult? Function(InternalEmployeeStateSuccess value)? success,
    TResult? Function(InternalEmployeeStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalEmployeeStateInitial value)? initial,
    TResult Function(InternalEmployeeStateLoading value)? loading,
    TResult Function(InternalEmployeeStateSuccess value)? success,
    TResult Function(InternalEmployeeStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InternalEmployeeStateInitial implements InternalEmployeeState {
  const factory InternalEmployeeStateInitial() = _$InternalEmployeeStateInitial;
}

/// @nodoc
abstract class _$$InternalEmployeeStateLoadingCopyWith<$Res> {
  factory _$$InternalEmployeeStateLoadingCopyWith(
          _$InternalEmployeeStateLoading value,
          $Res Function(_$InternalEmployeeStateLoading) then) =
      __$$InternalEmployeeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternalEmployeeStateLoadingCopyWithImpl<$Res>
    extends _$InternalEmployeeStateCopyWithImpl<$Res,
        _$InternalEmployeeStateLoading>
    implements _$$InternalEmployeeStateLoadingCopyWith<$Res> {
  __$$InternalEmployeeStateLoadingCopyWithImpl(
      _$InternalEmployeeStateLoading _value,
      $Res Function(_$InternalEmployeeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternalEmployeeStateLoading implements InternalEmployeeStateLoading {
  const _$InternalEmployeeStateLoading();

  @override
  String toString() {
    return 'InternalEmployeeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalEmployeeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(InternalEmployeeStateInitial value) initial,
    required TResult Function(InternalEmployeeStateLoading value) loading,
    required TResult Function(InternalEmployeeStateSuccess value) success,
    required TResult Function(InternalEmployeeStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalEmployeeStateInitial value)? initial,
    TResult? Function(InternalEmployeeStateLoading value)? loading,
    TResult? Function(InternalEmployeeStateSuccess value)? success,
    TResult? Function(InternalEmployeeStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalEmployeeStateInitial value)? initial,
    TResult Function(InternalEmployeeStateLoading value)? loading,
    TResult Function(InternalEmployeeStateSuccess value)? success,
    TResult Function(InternalEmployeeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InternalEmployeeStateLoading implements InternalEmployeeState {
  const factory InternalEmployeeStateLoading() = _$InternalEmployeeStateLoading;
}

/// @nodoc
abstract class _$$InternalEmployeeStateSuccessCopyWith<$Res> {
  factory _$$InternalEmployeeStateSuccessCopyWith(
          _$InternalEmployeeStateSuccess value,
          $Res Function(_$InternalEmployeeStateSuccess) then) =
      __$$InternalEmployeeStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternalEmployeeStateSuccessCopyWithImpl<$Res>
    extends _$InternalEmployeeStateCopyWithImpl<$Res,
        _$InternalEmployeeStateSuccess>
    implements _$$InternalEmployeeStateSuccessCopyWith<$Res> {
  __$$InternalEmployeeStateSuccessCopyWithImpl(
      _$InternalEmployeeStateSuccess _value,
      $Res Function(_$InternalEmployeeStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternalEmployeeStateSuccess implements InternalEmployeeStateSuccess {
  const _$InternalEmployeeStateSuccess();

  @override
  String toString() {
    return 'InternalEmployeeState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalEmployeeStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternalEmployeeStateInitial value) initial,
    required TResult Function(InternalEmployeeStateLoading value) loading,
    required TResult Function(InternalEmployeeStateSuccess value) success,
    required TResult Function(InternalEmployeeStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalEmployeeStateInitial value)? initial,
    TResult? Function(InternalEmployeeStateLoading value)? loading,
    TResult? Function(InternalEmployeeStateSuccess value)? success,
    TResult? Function(InternalEmployeeStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalEmployeeStateInitial value)? initial,
    TResult Function(InternalEmployeeStateLoading value)? loading,
    TResult Function(InternalEmployeeStateSuccess value)? success,
    TResult Function(InternalEmployeeStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class InternalEmployeeStateSuccess implements InternalEmployeeState {
  const factory InternalEmployeeStateSuccess() = _$InternalEmployeeStateSuccess;
}

/// @nodoc
abstract class _$$InternalEmployeeStateErrorCopyWith<$Res> {
  factory _$$InternalEmployeeStateErrorCopyWith(
          _$InternalEmployeeStateError value,
          $Res Function(_$InternalEmployeeStateError) then) =
      __$$InternalEmployeeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$InternalEmployeeStateErrorCopyWithImpl<$Res>
    extends _$InternalEmployeeStateCopyWithImpl<$Res,
        _$InternalEmployeeStateError>
    implements _$$InternalEmployeeStateErrorCopyWith<$Res> {
  __$$InternalEmployeeStateErrorCopyWithImpl(
      _$InternalEmployeeStateError _value,
      $Res Function(_$InternalEmployeeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$InternalEmployeeStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as KFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $KFailureCopyWith<$Res> get error {
    return $KFailureCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$InternalEmployeeStateError implements InternalEmployeeStateError {
  const _$InternalEmployeeStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'InternalEmployeeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalEmployeeStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalEmployeeStateErrorCopyWith<_$InternalEmployeeStateError>
      get copyWith => __$$InternalEmployeeStateErrorCopyWithImpl<
          _$InternalEmployeeStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(InternalEmployeeStateInitial value) initial,
    required TResult Function(InternalEmployeeStateLoading value) loading,
    required TResult Function(InternalEmployeeStateSuccess value) success,
    required TResult Function(InternalEmployeeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternalEmployeeStateInitial value)? initial,
    TResult? Function(InternalEmployeeStateLoading value)? loading,
    TResult? Function(InternalEmployeeStateSuccess value)? success,
    TResult? Function(InternalEmployeeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternalEmployeeStateInitial value)? initial,
    TResult Function(InternalEmployeeStateLoading value)? loading,
    TResult Function(InternalEmployeeStateSuccess value)? success,
    TResult Function(InternalEmployeeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InternalEmployeeStateError implements InternalEmployeeState {
  const factory InternalEmployeeStateError({required final KFailure error}) =
      _$InternalEmployeeStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$InternalEmployeeStateErrorCopyWith<_$InternalEmployeeStateError>
      get copyWith => throw _privateConstructorUsedError;
}
