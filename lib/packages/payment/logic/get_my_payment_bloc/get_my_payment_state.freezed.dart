// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_my_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPaymentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyPaymentsModel myPaymentsModel) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyPaymentsModel myPaymentsModel)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyPaymentsModel myPaymentsModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyPaymentsStateLoading value) loading,
    required TResult Function(MyPaymentsStateSuccess value) success,
    required TResult Function(MyPaymentsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyPaymentsStateLoading value)? loading,
    TResult? Function(MyPaymentsStateSuccess value)? success,
    TResult? Function(MyPaymentsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyPaymentsStateLoading value)? loading,
    TResult Function(MyPaymentsStateSuccess value)? success,
    TResult Function(MyPaymentsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPaymentsStateCopyWith<$Res> {
  factory $MyPaymentsStateCopyWith(
          MyPaymentsState value, $Res Function(MyPaymentsState) then) =
      _$MyPaymentsStateCopyWithImpl<$Res, MyPaymentsState>;
}

/// @nodoc
class _$MyPaymentsStateCopyWithImpl<$Res, $Val extends MyPaymentsState>
    implements $MyPaymentsStateCopyWith<$Res> {
  _$MyPaymentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MyPaymentsStateLoadingCopyWith<$Res> {
  factory _$$MyPaymentsStateLoadingCopyWith(_$MyPaymentsStateLoading value,
          $Res Function(_$MyPaymentsStateLoading) then) =
      __$$MyPaymentsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyPaymentsStateLoadingCopyWithImpl<$Res>
    extends _$MyPaymentsStateCopyWithImpl<$Res, _$MyPaymentsStateLoading>
    implements _$$MyPaymentsStateLoadingCopyWith<$Res> {
  __$$MyPaymentsStateLoadingCopyWithImpl(_$MyPaymentsStateLoading _value,
      $Res Function(_$MyPaymentsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyPaymentsStateLoading implements MyPaymentsStateLoading {
  const _$MyPaymentsStateLoading();

  @override
  String toString() {
    return 'MyPaymentsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyPaymentsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyPaymentsModel myPaymentsModel) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyPaymentsModel myPaymentsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyPaymentsModel myPaymentsModel)? success,
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
    required TResult Function(MyPaymentsStateLoading value) loading,
    required TResult Function(MyPaymentsStateSuccess value) success,
    required TResult Function(MyPaymentsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyPaymentsStateLoading value)? loading,
    TResult? Function(MyPaymentsStateSuccess value)? success,
    TResult? Function(MyPaymentsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyPaymentsStateLoading value)? loading,
    TResult Function(MyPaymentsStateSuccess value)? success,
    TResult Function(MyPaymentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyPaymentsStateLoading implements MyPaymentsState {
  const factory MyPaymentsStateLoading() = _$MyPaymentsStateLoading;
}

/// @nodoc
abstract class _$$MyPaymentsStateSuccessCopyWith<$Res> {
  factory _$$MyPaymentsStateSuccessCopyWith(_$MyPaymentsStateSuccess value,
          $Res Function(_$MyPaymentsStateSuccess) then) =
      __$$MyPaymentsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({MyPaymentsModel myPaymentsModel});
}

/// @nodoc
class __$$MyPaymentsStateSuccessCopyWithImpl<$Res>
    extends _$MyPaymentsStateCopyWithImpl<$Res, _$MyPaymentsStateSuccess>
    implements _$$MyPaymentsStateSuccessCopyWith<$Res> {
  __$$MyPaymentsStateSuccessCopyWithImpl(_$MyPaymentsStateSuccess _value,
      $Res Function(_$MyPaymentsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myPaymentsModel = null,
  }) {
    return _then(_$MyPaymentsStateSuccess(
      myPaymentsModel: null == myPaymentsModel
          ? _value.myPaymentsModel
          : myPaymentsModel // ignore: cast_nullable_to_non_nullable
              as MyPaymentsModel,
    ));
  }
}

/// @nodoc

class _$MyPaymentsStateSuccess implements MyPaymentsStateSuccess {
  const _$MyPaymentsStateSuccess({required this.myPaymentsModel});

  @override
  final MyPaymentsModel myPaymentsModel;

  @override
  String toString() {
    return 'MyPaymentsState.success(myPaymentsModel: $myPaymentsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPaymentsStateSuccess &&
            (identical(other.myPaymentsModel, myPaymentsModel) ||
                other.myPaymentsModel == myPaymentsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myPaymentsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPaymentsStateSuccessCopyWith<_$MyPaymentsStateSuccess> get copyWith =>
      __$$MyPaymentsStateSuccessCopyWithImpl<_$MyPaymentsStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyPaymentsModel myPaymentsModel) success,
    required TResult Function(String error) error,
  }) {
    return success(myPaymentsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyPaymentsModel myPaymentsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(myPaymentsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyPaymentsModel myPaymentsModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(myPaymentsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyPaymentsStateLoading value) loading,
    required TResult Function(MyPaymentsStateSuccess value) success,
    required TResult Function(MyPaymentsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyPaymentsStateLoading value)? loading,
    TResult? Function(MyPaymentsStateSuccess value)? success,
    TResult? Function(MyPaymentsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyPaymentsStateLoading value)? loading,
    TResult Function(MyPaymentsStateSuccess value)? success,
    TResult Function(MyPaymentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MyPaymentsStateSuccess implements MyPaymentsState {
  const factory MyPaymentsStateSuccess(
          {required final MyPaymentsModel myPaymentsModel}) =
      _$MyPaymentsStateSuccess;

  MyPaymentsModel get myPaymentsModel;
  @JsonKey(ignore: true)
  _$$MyPaymentsStateSuccessCopyWith<_$MyPaymentsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyPaymentsStateErrorCopyWith<$Res> {
  factory _$$MyPaymentsStateErrorCopyWith(_$MyPaymentsStateError value,
          $Res Function(_$MyPaymentsStateError) then) =
      __$$MyPaymentsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MyPaymentsStateErrorCopyWithImpl<$Res>
    extends _$MyPaymentsStateCopyWithImpl<$Res, _$MyPaymentsStateError>
    implements _$$MyPaymentsStateErrorCopyWith<$Res> {
  __$$MyPaymentsStateErrorCopyWithImpl(_$MyPaymentsStateError _value,
      $Res Function(_$MyPaymentsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MyPaymentsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyPaymentsStateError implements MyPaymentsStateError {
  const _$MyPaymentsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'MyPaymentsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPaymentsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPaymentsStateErrorCopyWith<_$MyPaymentsStateError> get copyWith =>
      __$$MyPaymentsStateErrorCopyWithImpl<_$MyPaymentsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyPaymentsModel myPaymentsModel) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyPaymentsModel myPaymentsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyPaymentsModel myPaymentsModel)? success,
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
    required TResult Function(MyPaymentsStateLoading value) loading,
    required TResult Function(MyPaymentsStateSuccess value) success,
    required TResult Function(MyPaymentsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyPaymentsStateLoading value)? loading,
    TResult? Function(MyPaymentsStateSuccess value)? success,
    TResult? Function(MyPaymentsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyPaymentsStateLoading value)? loading,
    TResult Function(MyPaymentsStateSuccess value)? success,
    TResult Function(MyPaymentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MyPaymentsStateError implements MyPaymentsState {
  const factory MyPaymentsStateError({required final String error}) =
      _$MyPaymentsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$MyPaymentsStateErrorCopyWith<_$MyPaymentsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
