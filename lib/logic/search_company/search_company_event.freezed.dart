// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_company_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  String get qry => throw _privateConstructorUsedError;
  int get srvId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qry, int srvId) search,
    required TResult Function(String qry, int srvId) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String qry, int srvId)? search,
    TResult? Function(String qry, int srvId)? api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qry, int srvId)? search,
    TResult Function(String qry, int srvId)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventApi value) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventApi value)? api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventApi value)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchEventCopyWith<SearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
  @useResult
  $Res call({String qry, int srvId});
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qry = null,
    Object? srvId = null,
  }) {
    return _then(_value.copyWith(
      qry: null == qry
          ? _value.qry
          : qry // ignore: cast_nullable_to_non_nullable
              as String,
      srvId: null == srvId
          ? _value.srvId
          : srvId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchEventSearchCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$SearchEventSearchCopyWith(
          _$SearchEventSearch value, $Res Function(_$SearchEventSearch) then) =
      __$$SearchEventSearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qry, int srvId});
}

/// @nodoc
class __$$SearchEventSearchCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventSearch>
    implements _$$SearchEventSearchCopyWith<$Res> {
  __$$SearchEventSearchCopyWithImpl(
      _$SearchEventSearch _value, $Res Function(_$SearchEventSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qry = null,
    Object? srvId = null,
  }) {
    return _then(_$SearchEventSearch(
      qry: null == qry
          ? _value.qry
          : qry // ignore: cast_nullable_to_non_nullable
              as String,
      srvId: null == srvId
          ? _value.srvId
          : srvId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchEventSearch implements SearchEventSearch {
  const _$SearchEventSearch({required this.qry, required this.srvId});

  @override
  final String qry;
  @override
  final int srvId;

  @override
  String toString() {
    return 'SearchEvent.search(qry: $qry, srvId: $srvId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventSearch &&
            (identical(other.qry, qry) || other.qry == qry) &&
            (identical(other.srvId, srvId) || other.srvId == srvId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qry, srvId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventSearchCopyWith<_$SearchEventSearch> get copyWith =>
      __$$SearchEventSearchCopyWithImpl<_$SearchEventSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qry, int srvId) search,
    required TResult Function(String qry, int srvId) api,
  }) {
    return search(qry, srvId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String qry, int srvId)? search,
    TResult? Function(String qry, int srvId)? api,
  }) {
    return search?.call(qry, srvId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qry, int srvId)? search,
    TResult Function(String qry, int srvId)? api,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(qry, srvId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventApi value) api,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventApi value)? api,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventApi value)? api,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SearchEventSearch implements SearchEvent {
  const factory SearchEventSearch(
      {required final String qry,
      required final int srvId}) = _$SearchEventSearch;

  @override
  String get qry;
  @override
  int get srvId;
  @override
  @JsonKey(ignore: true)
  _$$SearchEventSearchCopyWith<_$SearchEventSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventApiCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$SearchEventApiCopyWith(
          _$SearchEventApi value, $Res Function(_$SearchEventApi) then) =
      __$$SearchEventApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qry, int srvId});
}

/// @nodoc
class __$$SearchEventApiCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventApi>
    implements _$$SearchEventApiCopyWith<$Res> {
  __$$SearchEventApiCopyWithImpl(
      _$SearchEventApi _value, $Res Function(_$SearchEventApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qry = null,
    Object? srvId = null,
  }) {
    return _then(_$SearchEventApi(
      qry: null == qry
          ? _value.qry
          : qry // ignore: cast_nullable_to_non_nullable
              as String,
      srvId: null == srvId
          ? _value.srvId
          : srvId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchEventApi implements SearchEventApi {
  const _$SearchEventApi({required this.qry, required this.srvId});

  @override
  final String qry;
  @override
  final int srvId;

  @override
  String toString() {
    return 'SearchEvent.api(qry: $qry, srvId: $srvId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventApi &&
            (identical(other.qry, qry) || other.qry == qry) &&
            (identical(other.srvId, srvId) || other.srvId == srvId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qry, srvId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventApiCopyWith<_$SearchEventApi> get copyWith =>
      __$$SearchEventApiCopyWithImpl<_$SearchEventApi>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qry, int srvId) search,
    required TResult Function(String qry, int srvId) api,
  }) {
    return api(qry, srvId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String qry, int srvId)? search,
    TResult? Function(String qry, int srvId)? api,
  }) {
    return api?.call(qry, srvId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qry, int srvId)? search,
    TResult Function(String qry, int srvId)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(qry, srvId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventApi value) api,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventApi value)? api,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventApi value)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class SearchEventApi implements SearchEvent {
  const factory SearchEventApi(
      {required final String qry, required final int srvId}) = _$SearchEventApi;

  @override
  String get qry;
  @override
  int get srvId;
  @override
  @JsonKey(ignore: true)
  _$$SearchEventApiCopyWith<_$SearchEventApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateSuccess value) success,
    required TResult Function(SearchStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateSuccess value)? success,
    TResult? Function(SearchStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateSuccess value)? success,
    TResult Function(SearchStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchStateInitialCopyWith<$Res> {
  factory _$$SearchStateInitialCopyWith(_$SearchStateInitial value,
          $Res Function(_$SearchStateInitial) then) =
      __$$SearchStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateInitialCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateInitial>
    implements _$$SearchStateInitialCopyWith<$Res> {
  __$$SearchStateInitialCopyWithImpl(
      _$SearchStateInitial _value, $Res Function(_$SearchStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateInitial implements SearchStateInitial {
  const _$SearchStateInitial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateSuccess value) success,
    required TResult Function(SearchStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateSuccess value)? success,
    TResult? Function(SearchStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateSuccess value)? success,
    TResult Function(SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SearchStateInitial implements SearchState {
  const factory SearchStateInitial() = _$SearchStateInitial;
}

/// @nodoc
abstract class _$$SearchStateLoadingCopyWith<$Res> {
  factory _$$SearchStateLoadingCopyWith(_$SearchStateLoading value,
          $Res Function(_$SearchStateLoading) then) =
      __$$SearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateLoadingCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateLoading>
    implements _$$SearchStateLoadingCopyWith<$Res> {
  __$$SearchStateLoadingCopyWithImpl(
      _$SearchStateLoading _value, $Res Function(_$SearchStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateLoading implements SearchStateLoading {
  const _$SearchStateLoading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateSuccess value) success,
    required TResult Function(SearchStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateSuccess value)? success,
    TResult? Function(SearchStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateSuccess value)? success,
    TResult Function(SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SearchStateLoading implements SearchState {
  const factory SearchStateLoading() = _$SearchStateLoading;
}

/// @nodoc
abstract class _$$SearchStateSuccessCopyWith<$Res> {
  factory _$$SearchStateSuccessCopyWith(_$SearchStateSuccess value,
          $Res Function(_$SearchStateSuccess) then) =
      __$$SearchStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateSuccessCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateSuccess>
    implements _$$SearchStateSuccessCopyWith<$Res> {
  __$$SearchStateSuccessCopyWithImpl(
      _$SearchStateSuccess _value, $Res Function(_$SearchStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateSuccess implements SearchStateSuccess {
  const _$SearchStateSuccess();

  @override
  String toString() {
    return 'SearchState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateSuccess value) success,
    required TResult Function(SearchStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateSuccess value)? success,
    TResult? Function(SearchStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateSuccess value)? success,
    TResult Function(SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SearchStateSuccess implements SearchState {
  const factory SearchStateSuccess() = _$SearchStateSuccess;
}

/// @nodoc
abstract class _$$SearchStateErrorCopyWith<$Res> {
  factory _$$SearchStateErrorCopyWith(
          _$SearchStateError value, $Res Function(_$SearchStateError) then) =
      __$$SearchStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SearchStateErrorCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateError>
    implements _$$SearchStateErrorCopyWith<$Res> {
  __$$SearchStateErrorCopyWithImpl(
      _$SearchStateError _value, $Res Function(_$SearchStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SearchStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchStateError implements SearchStateError {
  const _$SearchStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateErrorCopyWith<_$SearchStateError> get copyWith =>
      __$$SearchStateErrorCopyWithImpl<_$SearchStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateSuccess value) success,
    required TResult Function(SearchStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateSuccess value)? success,
    TResult? Function(SearchStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateSuccess value)? success,
    TResult Function(SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchStateError implements SearchState {
  const factory SearchStateError({required final String error}) =
      _$SearchStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$SearchStateErrorCopyWith<_$SearchStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
