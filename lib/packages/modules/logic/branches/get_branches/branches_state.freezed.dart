// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branches_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BranchesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BranchModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BranchModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BranchModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchesStateInitial value) initial,
    required TResult Function(BranchesStateLoading value) loading,
    required TResult Function(BranchesStateSuccess value) success,
    required TResult Function(BranchesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BranchesStateInitial value)? initial,
    TResult? Function(BranchesStateLoading value)? loading,
    TResult? Function(BranchesStateSuccess value)? success,
    TResult? Function(BranchesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchesStateInitial value)? initial,
    TResult Function(BranchesStateLoading value)? loading,
    TResult Function(BranchesStateSuccess value)? success,
    TResult Function(BranchesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchesStateCopyWith<$Res> {
  factory $BranchesStateCopyWith(
          BranchesState value, $Res Function(BranchesState) then) =
      _$BranchesStateCopyWithImpl<$Res, BranchesState>;
}

/// @nodoc
class _$BranchesStateCopyWithImpl<$Res, $Val extends BranchesState>
    implements $BranchesStateCopyWith<$Res> {
  _$BranchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BranchesStateInitialCopyWith<$Res> {
  factory _$$BranchesStateInitialCopyWith(_$BranchesStateInitial value,
          $Res Function(_$BranchesStateInitial) then) =
      __$$BranchesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchesStateInitialCopyWithImpl<$Res>
    extends _$BranchesStateCopyWithImpl<$Res, _$BranchesStateInitial>
    implements _$$BranchesStateInitialCopyWith<$Res> {
  __$$BranchesStateInitialCopyWithImpl(_$BranchesStateInitial _value,
      $Res Function(_$BranchesStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BranchesStateInitial implements BranchesStateInitial {
  const _$BranchesStateInitial();

  @override
  String toString() {
    return 'BranchesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchesStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BranchModel model) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BranchModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BranchModel model)? success,
    TResult Function(String error)? error,
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
    required TResult Function(BranchesStateInitial value) initial,
    required TResult Function(BranchesStateLoading value) loading,
    required TResult Function(BranchesStateSuccess value) success,
    required TResult Function(BranchesStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BranchesStateInitial value)? initial,
    TResult? Function(BranchesStateLoading value)? loading,
    TResult? Function(BranchesStateSuccess value)? success,
    TResult? Function(BranchesStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchesStateInitial value)? initial,
    TResult Function(BranchesStateLoading value)? loading,
    TResult Function(BranchesStateSuccess value)? success,
    TResult Function(BranchesStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BranchesStateInitial implements BranchesState {
  const factory BranchesStateInitial() = _$BranchesStateInitial;
}

/// @nodoc
abstract class _$$BranchesStateLoadingCopyWith<$Res> {
  factory _$$BranchesStateLoadingCopyWith(_$BranchesStateLoading value,
          $Res Function(_$BranchesStateLoading) then) =
      __$$BranchesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchesStateLoadingCopyWithImpl<$Res>
    extends _$BranchesStateCopyWithImpl<$Res, _$BranchesStateLoading>
    implements _$$BranchesStateLoadingCopyWith<$Res> {
  __$$BranchesStateLoadingCopyWithImpl(_$BranchesStateLoading _value,
      $Res Function(_$BranchesStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BranchesStateLoading implements BranchesStateLoading {
  const _$BranchesStateLoading();

  @override
  String toString() {
    return 'BranchesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BranchModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BranchModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BranchModel model)? success,
    TResult Function(String error)? error,
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
    required TResult Function(BranchesStateInitial value) initial,
    required TResult Function(BranchesStateLoading value) loading,
    required TResult Function(BranchesStateSuccess value) success,
    required TResult Function(BranchesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BranchesStateInitial value)? initial,
    TResult? Function(BranchesStateLoading value)? loading,
    TResult? Function(BranchesStateSuccess value)? success,
    TResult? Function(BranchesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchesStateInitial value)? initial,
    TResult Function(BranchesStateLoading value)? loading,
    TResult Function(BranchesStateSuccess value)? success,
    TResult Function(BranchesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BranchesStateLoading implements BranchesState {
  const factory BranchesStateLoading() = _$BranchesStateLoading;
}

/// @nodoc
abstract class _$$BranchesStateSuccessCopyWith<$Res> {
  factory _$$BranchesStateSuccessCopyWith(_$BranchesStateSuccess value,
          $Res Function(_$BranchesStateSuccess) then) =
      __$$BranchesStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({BranchModel model});
}

/// @nodoc
class __$$BranchesStateSuccessCopyWithImpl<$Res>
    extends _$BranchesStateCopyWithImpl<$Res, _$BranchesStateSuccess>
    implements _$$BranchesStateSuccessCopyWith<$Res> {
  __$$BranchesStateSuccessCopyWithImpl(_$BranchesStateSuccess _value,
      $Res Function(_$BranchesStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$BranchesStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as BranchModel,
    ));
  }
}

/// @nodoc

class _$BranchesStateSuccess implements BranchesStateSuccess {
  const _$BranchesStateSuccess({required this.model});

  @override
  final BranchModel model;

  @override
  String toString() {
    return 'BranchesState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchesStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchesStateSuccessCopyWith<_$BranchesStateSuccess> get copyWith =>
      __$$BranchesStateSuccessCopyWithImpl<_$BranchesStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BranchModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BranchModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BranchModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchesStateInitial value) initial,
    required TResult Function(BranchesStateLoading value) loading,
    required TResult Function(BranchesStateSuccess value) success,
    required TResult Function(BranchesStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BranchesStateInitial value)? initial,
    TResult? Function(BranchesStateLoading value)? loading,
    TResult? Function(BranchesStateSuccess value)? success,
    TResult? Function(BranchesStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchesStateInitial value)? initial,
    TResult Function(BranchesStateLoading value)? loading,
    TResult Function(BranchesStateSuccess value)? success,
    TResult Function(BranchesStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BranchesStateSuccess implements BranchesState {
  const factory BranchesStateSuccess({required final BranchModel model}) =
      _$BranchesStateSuccess;

  BranchModel get model;
  @JsonKey(ignore: true)
  _$$BranchesStateSuccessCopyWith<_$BranchesStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BranchesStateErrorCopyWith<$Res> {
  factory _$$BranchesStateErrorCopyWith(_$BranchesStateError value,
          $Res Function(_$BranchesStateError) then) =
      __$$BranchesStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$BranchesStateErrorCopyWithImpl<$Res>
    extends _$BranchesStateCopyWithImpl<$Res, _$BranchesStateError>
    implements _$$BranchesStateErrorCopyWith<$Res> {
  __$$BranchesStateErrorCopyWithImpl(
      _$BranchesStateError _value, $Res Function(_$BranchesStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BranchesStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BranchesStateError implements BranchesStateError {
  const _$BranchesStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'BranchesState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchesStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchesStateErrorCopyWith<_$BranchesStateError> get copyWith =>
      __$$BranchesStateErrorCopyWithImpl<_$BranchesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BranchModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BranchModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BranchModel model)? success,
    TResult Function(String error)? error,
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
    required TResult Function(BranchesStateInitial value) initial,
    required TResult Function(BranchesStateLoading value) loading,
    required TResult Function(BranchesStateSuccess value) success,
    required TResult Function(BranchesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BranchesStateInitial value)? initial,
    TResult? Function(BranchesStateLoading value)? loading,
    TResult? Function(BranchesStateSuccess value)? success,
    TResult? Function(BranchesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchesStateInitial value)? initial,
    TResult Function(BranchesStateLoading value)? loading,
    TResult Function(BranchesStateSuccess value)? success,
    TResult Function(BranchesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BranchesStateError implements BranchesState {
  const factory BranchesStateError({required final String error}) =
      _$BranchesStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$BranchesStateErrorCopyWith<_$BranchesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
