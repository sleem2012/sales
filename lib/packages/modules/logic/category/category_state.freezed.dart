// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryStateInitial value)? initial,
    TResult? Function(CategoryStateLoading value)? loading,
    TResult? Function(CategoryStateSuccess value)? success,
    TResult? Function(CategoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CategoryStateInitialCopyWith<$Res> {
  factory _$$CategoryStateInitialCopyWith(_$CategoryStateInitial value,
          $Res Function(_$CategoryStateInitial) then) =
      __$$CategoryStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryStateInitialCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateInitial>
    implements _$$CategoryStateInitialCopyWith<$Res> {
  __$$CategoryStateInitialCopyWithImpl(_$CategoryStateInitial _value,
      $Res Function(_$CategoryStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryStateInitial implements CategoryStateInitial {
  const _$CategoryStateInitial();

  @override
  String toString() {
    return 'CategoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryModel model) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryModel model)? success,
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryStateInitial value)? initial,
    TResult? Function(CategoryStateLoading value)? loading,
    TResult? Function(CategoryStateSuccess value)? success,
    TResult? Function(CategoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CategoryStateInitial implements CategoryState {
  const factory CategoryStateInitial() = _$CategoryStateInitial;
}

/// @nodoc
abstract class _$$CategoryStateLoadingCopyWith<$Res> {
  factory _$$CategoryStateLoadingCopyWith(_$CategoryStateLoading value,
          $Res Function(_$CategoryStateLoading) then) =
      __$$CategoryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryStateLoadingCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateLoading>
    implements _$$CategoryStateLoadingCopyWith<$Res> {
  __$$CategoryStateLoadingCopyWithImpl(_$CategoryStateLoading _value,
      $Res Function(_$CategoryStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryStateLoading implements CategoryStateLoading {
  const _$CategoryStateLoading();

  @override
  String toString() {
    return 'CategoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryModel model)? success,
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryStateInitial value)? initial,
    TResult? Function(CategoryStateLoading value)? loading,
    TResult? Function(CategoryStateSuccess value)? success,
    TResult? Function(CategoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoryStateLoading implements CategoryState {
  const factory CategoryStateLoading() = _$CategoryStateLoading;
}

/// @nodoc
abstract class _$$CategoryStateSuccessCopyWith<$Res> {
  factory _$$CategoryStateSuccessCopyWith(_$CategoryStateSuccess value,
          $Res Function(_$CategoryStateSuccess) then) =
      __$$CategoryStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryModel model});
}

/// @nodoc
class __$$CategoryStateSuccessCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateSuccess>
    implements _$$CategoryStateSuccessCopyWith<$Res> {
  __$$CategoryStateSuccessCopyWithImpl(_$CategoryStateSuccess _value,
      $Res Function(_$CategoryStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$CategoryStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$CategoryStateSuccess implements CategoryStateSuccess {
  const _$CategoryStateSuccess({required this.model});

  @override
  final CategoryModel model;

  @override
  String toString() {
    return 'CategoryState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateSuccessCopyWith<_$CategoryStateSuccess> get copyWith =>
      __$$CategoryStateSuccessCopyWithImpl<_$CategoryStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryModel model)? success,
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryStateInitial value)? initial,
    TResult? Function(CategoryStateLoading value)? loading,
    TResult? Function(CategoryStateSuccess value)? success,
    TResult? Function(CategoryStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CategoryStateSuccess implements CategoryState {
  const factory CategoryStateSuccess({required final CategoryModel model}) =
      _$CategoryStateSuccess;

  CategoryModel get model;
  @JsonKey(ignore: true)
  _$$CategoryStateSuccessCopyWith<_$CategoryStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryStateErrorCopyWith<$Res> {
  factory _$$CategoryStateErrorCopyWith(_$CategoryStateError value,
          $Res Function(_$CategoryStateError) then) =
      __$$CategoryStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CategoryStateErrorCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateError>
    implements _$$CategoryStateErrorCopyWith<$Res> {
  __$$CategoryStateErrorCopyWithImpl(
      _$CategoryStateError _value, $Res Function(_$CategoryStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CategoryStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryStateError implements CategoryStateError {
  const _$CategoryStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CategoryState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateErrorCopyWith<_$CategoryStateError> get copyWith =>
      __$$CategoryStateErrorCopyWithImpl<_$CategoryStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryModel model)? success,
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryStateInitial value)? initial,
    TResult? Function(CategoryStateLoading value)? loading,
    TResult? Function(CategoryStateSuccess value)? success,
    TResult? Function(CategoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoryStateError implements CategoryState {
  const factory CategoryStateError({required final String error}) =
      _$CategoryStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CategoryStateErrorCopyWith<_$CategoryStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
