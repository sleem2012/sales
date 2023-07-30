// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_banks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetBanksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BanksModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BanksModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BanksModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBanksStateLoading value) loading,
    required TResult Function(GetBanksStateSuccess value) success,
    required TResult Function(GetBanksStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBanksStateLoading value)? loading,
    TResult? Function(GetBanksStateSuccess value)? success,
    TResult? Function(GetBanksStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBanksStateLoading value)? loading,
    TResult Function(GetBanksStateSuccess value)? success,
    TResult Function(GetBanksStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBanksStateCopyWith<$Res> {
  factory $GetBanksStateCopyWith(
          GetBanksState value, $Res Function(GetBanksState) then) =
      _$GetBanksStateCopyWithImpl<$Res, GetBanksState>;
}

/// @nodoc
class _$GetBanksStateCopyWithImpl<$Res, $Val extends GetBanksState>
    implements $GetBanksStateCopyWith<$Res> {
  _$GetBanksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBanksStateLoadingCopyWith<$Res> {
  factory _$$GetBanksStateLoadingCopyWith(_$GetBanksStateLoading value,
          $Res Function(_$GetBanksStateLoading) then) =
      __$$GetBanksStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBanksStateLoadingCopyWithImpl<$Res>
    extends _$GetBanksStateCopyWithImpl<$Res, _$GetBanksStateLoading>
    implements _$$GetBanksStateLoadingCopyWith<$Res> {
  __$$GetBanksStateLoadingCopyWithImpl(_$GetBanksStateLoading _value,
      $Res Function(_$GetBanksStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBanksStateLoading implements GetBanksStateLoading {
  const _$GetBanksStateLoading();

  @override
  String toString() {
    return 'GetBanksState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBanksStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BanksModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BanksModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BanksModel model)? success,
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
    required TResult Function(GetBanksStateLoading value) loading,
    required TResult Function(GetBanksStateSuccess value) success,
    required TResult Function(GetBanksStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBanksStateLoading value)? loading,
    TResult? Function(GetBanksStateSuccess value)? success,
    TResult? Function(GetBanksStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBanksStateLoading value)? loading,
    TResult Function(GetBanksStateSuccess value)? success,
    TResult Function(GetBanksStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetBanksStateLoading implements GetBanksState {
  const factory GetBanksStateLoading() = _$GetBanksStateLoading;
}

/// @nodoc
abstract class _$$GetBanksStateSuccessCopyWith<$Res> {
  factory _$$GetBanksStateSuccessCopyWith(_$GetBanksStateSuccess value,
          $Res Function(_$GetBanksStateSuccess) then) =
      __$$GetBanksStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({BanksModel model});
}

/// @nodoc
class __$$GetBanksStateSuccessCopyWithImpl<$Res>
    extends _$GetBanksStateCopyWithImpl<$Res, _$GetBanksStateSuccess>
    implements _$$GetBanksStateSuccessCopyWith<$Res> {
  __$$GetBanksStateSuccessCopyWithImpl(_$GetBanksStateSuccess _value,
      $Res Function(_$GetBanksStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$GetBanksStateSuccess(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as BanksModel,
    ));
  }
}

/// @nodoc

class _$GetBanksStateSuccess implements GetBanksStateSuccess {
  const _$GetBanksStateSuccess(this.model);

  @override
  final BanksModel model;

  @override
  String toString() {
    return 'GetBanksState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBanksStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBanksStateSuccessCopyWith<_$GetBanksStateSuccess> get copyWith =>
      __$$GetBanksStateSuccessCopyWithImpl<_$GetBanksStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BanksModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BanksModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BanksModel model)? success,
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
    required TResult Function(GetBanksStateLoading value) loading,
    required TResult Function(GetBanksStateSuccess value) success,
    required TResult Function(GetBanksStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBanksStateLoading value)? loading,
    TResult? Function(GetBanksStateSuccess value)? success,
    TResult? Function(GetBanksStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBanksStateLoading value)? loading,
    TResult Function(GetBanksStateSuccess value)? success,
    TResult Function(GetBanksStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetBanksStateSuccess implements GetBanksState {
  const factory GetBanksStateSuccess(final BanksModel model) =
      _$GetBanksStateSuccess;

  BanksModel get model;
  @JsonKey(ignore: true)
  _$$GetBanksStateSuccessCopyWith<_$GetBanksStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBanksStateErrorCopyWith<$Res> {
  factory _$$GetBanksStateErrorCopyWith(_$GetBanksStateError value,
          $Res Function(_$GetBanksStateError) then) =
      __$$GetBanksStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetBanksStateErrorCopyWithImpl<$Res>
    extends _$GetBanksStateCopyWithImpl<$Res, _$GetBanksStateError>
    implements _$$GetBanksStateErrorCopyWith<$Res> {
  __$$GetBanksStateErrorCopyWithImpl(
      _$GetBanksStateError _value, $Res Function(_$GetBanksStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetBanksStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetBanksStateError implements GetBanksStateError {
  const _$GetBanksStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetBanksState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBanksStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBanksStateErrorCopyWith<_$GetBanksStateError> get copyWith =>
      __$$GetBanksStateErrorCopyWithImpl<_$GetBanksStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BanksModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BanksModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BanksModel model)? success,
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
    required TResult Function(GetBanksStateLoading value) loading,
    required TResult Function(GetBanksStateSuccess value) success,
    required TResult Function(GetBanksStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBanksStateLoading value)? loading,
    TResult? Function(GetBanksStateSuccess value)? success,
    TResult? Function(GetBanksStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBanksStateLoading value)? loading,
    TResult Function(GetBanksStateSuccess value)? success,
    TResult Function(GetBanksStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetBanksStateError implements GetBanksState {
  const factory GetBanksStateError({required final String error}) =
      _$GetBanksStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$GetBanksStateErrorCopyWith<_$GetBanksStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
