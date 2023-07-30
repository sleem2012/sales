// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picker_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationPickerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker) mark,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Marker marker)? mark,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker)? mark,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationPickerStateLoading value) loading,
    required TResult Function(LocationPickerStateMark value) mark,
    required TResult Function(LocationPickerStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationPickerStateLoading value)? loading,
    TResult? Function(LocationPickerStateMark value)? mark,
    TResult? Function(LocationPickerStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationPickerStateLoading value)? loading,
    TResult Function(LocationPickerStateMark value)? mark,
    TResult Function(LocationPickerStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPickerStateCopyWith<$Res> {
  factory $LocationPickerStateCopyWith(
          LocationPickerState value, $Res Function(LocationPickerState) then) =
      _$LocationPickerStateCopyWithImpl<$Res, LocationPickerState>;
}

/// @nodoc
class _$LocationPickerStateCopyWithImpl<$Res, $Val extends LocationPickerState>
    implements $LocationPickerStateCopyWith<$Res> {
  _$LocationPickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LocationPickerStateLoadingCopyWith<$Res> {
  factory _$$LocationPickerStateLoadingCopyWith(
          _$LocationPickerStateLoading value,
          $Res Function(_$LocationPickerStateLoading) then) =
      __$$LocationPickerStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationPickerStateLoadingCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res,
        _$LocationPickerStateLoading>
    implements _$$LocationPickerStateLoadingCopyWith<$Res> {
  __$$LocationPickerStateLoadingCopyWithImpl(
      _$LocationPickerStateLoading _value,
      $Res Function(_$LocationPickerStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationPickerStateLoading implements LocationPickerStateLoading {
  const _$LocationPickerStateLoading();

  @override
  String toString() {
    return 'LocationPickerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPickerStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker) mark,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Marker marker)? mark,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker)? mark,
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
    required TResult Function(LocationPickerStateLoading value) loading,
    required TResult Function(LocationPickerStateMark value) mark,
    required TResult Function(LocationPickerStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationPickerStateLoading value)? loading,
    TResult? Function(LocationPickerStateMark value)? mark,
    TResult? Function(LocationPickerStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationPickerStateLoading value)? loading,
    TResult Function(LocationPickerStateMark value)? mark,
    TResult Function(LocationPickerStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LocationPickerStateLoading implements LocationPickerState {
  const factory LocationPickerStateLoading() = _$LocationPickerStateLoading;
}

/// @nodoc
abstract class _$$LocationPickerStateMarkCopyWith<$Res> {
  factory _$$LocationPickerStateMarkCopyWith(_$LocationPickerStateMark value,
          $Res Function(_$LocationPickerStateMark) then) =
      __$$LocationPickerStateMarkCopyWithImpl<$Res>;
  @useResult
  $Res call({Marker marker});
}

/// @nodoc
class __$$LocationPickerStateMarkCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res, _$LocationPickerStateMark>
    implements _$$LocationPickerStateMarkCopyWith<$Res> {
  __$$LocationPickerStateMarkCopyWithImpl(_$LocationPickerStateMark _value,
      $Res Function(_$LocationPickerStateMark) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
  }) {
    return _then(_$LocationPickerStateMark(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
    ));
  }
}

/// @nodoc

class _$LocationPickerStateMark implements LocationPickerStateMark {
  const _$LocationPickerStateMark({required this.marker});

  @override
  final Marker marker;

  @override
  String toString() {
    return 'LocationPickerState.mark(marker: $marker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPickerStateMark &&
            (identical(other.marker, marker) || other.marker == marker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, marker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPickerStateMarkCopyWith<_$LocationPickerStateMark> get copyWith =>
      __$$LocationPickerStateMarkCopyWithImpl<_$LocationPickerStateMark>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker) mark,
    required TResult Function(String error) error,
  }) {
    return mark(marker);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Marker marker)? mark,
    TResult? Function(String error)? error,
  }) {
    return mark?.call(marker);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker)? mark,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (mark != null) {
      return mark(marker);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationPickerStateLoading value) loading,
    required TResult Function(LocationPickerStateMark value) mark,
    required TResult Function(LocationPickerStateError value) error,
  }) {
    return mark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationPickerStateLoading value)? loading,
    TResult? Function(LocationPickerStateMark value)? mark,
    TResult? Function(LocationPickerStateError value)? error,
  }) {
    return mark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationPickerStateLoading value)? loading,
    TResult Function(LocationPickerStateMark value)? mark,
    TResult Function(LocationPickerStateError value)? error,
    required TResult orElse(),
  }) {
    if (mark != null) {
      return mark(this);
    }
    return orElse();
  }
}

abstract class LocationPickerStateMark implements LocationPickerState {
  const factory LocationPickerStateMark({required final Marker marker}) =
      _$LocationPickerStateMark;

  Marker get marker;
  @JsonKey(ignore: true)
  _$$LocationPickerStateMarkCopyWith<_$LocationPickerStateMark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPickerStateErrorCopyWith<$Res> {
  factory _$$LocationPickerStateErrorCopyWith(_$LocationPickerStateError value,
          $Res Function(_$LocationPickerStateError) then) =
      __$$LocationPickerStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$LocationPickerStateErrorCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res, _$LocationPickerStateError>
    implements _$$LocationPickerStateErrorCopyWith<$Res> {
  __$$LocationPickerStateErrorCopyWithImpl(_$LocationPickerStateError _value,
      $Res Function(_$LocationPickerStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LocationPickerStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationPickerStateError implements LocationPickerStateError {
  const _$LocationPickerStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'LocationPickerState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPickerStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPickerStateErrorCopyWith<_$LocationPickerStateError>
      get copyWith =>
          __$$LocationPickerStateErrorCopyWithImpl<_$LocationPickerStateError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker) mark,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Marker marker)? mark,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker)? mark,
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
    required TResult Function(LocationPickerStateLoading value) loading,
    required TResult Function(LocationPickerStateMark value) mark,
    required TResult Function(LocationPickerStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationPickerStateLoading value)? loading,
    TResult? Function(LocationPickerStateMark value)? mark,
    TResult? Function(LocationPickerStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationPickerStateLoading value)? loading,
    TResult Function(LocationPickerStateMark value)? mark,
    TResult Function(LocationPickerStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LocationPickerStateError implements LocationPickerState {
  const factory LocationPickerStateError({required final String error}) =
      _$LocationPickerStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$LocationPickerStateErrorCopyWith<_$LocationPickerStateError>
      get copyWith => throw _privateConstructorUsedError;
}
