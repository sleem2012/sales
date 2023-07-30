// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatRoomsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsStateCopyWith<$Res> {
  factory $ChatRoomsStateCopyWith(
          ChatRoomsState value, $Res Function(ChatRoomsState) then) =
      _$ChatRoomsStateCopyWithImpl<$Res, ChatRoomsState>;
}

/// @nodoc
class _$ChatRoomsStateCopyWithImpl<$Res, $Val extends ChatRoomsState>
    implements $ChatRoomsStateCopyWith<$Res> {
  _$ChatRoomsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatRoomsStateLoadingCopyWith<$Res> {
  factory _$$ChatRoomsStateLoadingCopyWith(_$ChatRoomsStateLoading value,
          $Res Function(_$ChatRoomsStateLoading) then) =
      __$$ChatRoomsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatRoomsStateLoadingCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$ChatRoomsStateLoading>
    implements _$$ChatRoomsStateLoadingCopyWith<$Res> {
  __$$ChatRoomsStateLoadingCopyWithImpl(_$ChatRoomsStateLoading _value,
      $Res Function(_$ChatRoomsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatRoomsStateLoading implements ChatRoomsStateLoading {
  const _$ChatRoomsStateLoading();

  @override
  String toString() {
    return 'ChatRoomsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatRoomsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
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
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatRoomsStateLoading implements ChatRoomsState {
  const factory ChatRoomsStateLoading() = _$ChatRoomsStateLoading;
}

/// @nodoc
abstract class _$$ChatRoomsStateCreateRoomLoadingCopyWith<$Res> {
  factory _$$ChatRoomsStateCreateRoomLoadingCopyWith(
          _$ChatRoomsStateCreateRoomLoading value,
          $Res Function(_$ChatRoomsStateCreateRoomLoading) then) =
      __$$ChatRoomsStateCreateRoomLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ChatRoomsStateCreateRoomLoadingCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res,
        _$ChatRoomsStateCreateRoomLoading>
    implements _$$ChatRoomsStateCreateRoomLoadingCopyWith<$Res> {
  __$$ChatRoomsStateCreateRoomLoadingCopyWithImpl(
      _$ChatRoomsStateCreateRoomLoading _value,
      $Res Function(_$ChatRoomsStateCreateRoomLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ChatRoomsStateCreateRoomLoading(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatRoomsStateCreateRoomLoading
    implements ChatRoomsStateCreateRoomLoading {
  const _$ChatRoomsStateCreateRoomLoading(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ChatRoomsState.createRoomLoading(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsStateCreateRoomLoading &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsStateCreateRoomLoadingCopyWith<_$ChatRoomsStateCreateRoomLoading>
      get copyWith => __$$ChatRoomsStateCreateRoomLoadingCopyWithImpl<
          _$ChatRoomsStateCreateRoomLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) {
    return createRoomLoading(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) {
    return createRoomLoading?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (createRoomLoading != null) {
      return createRoomLoading(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) {
    return createRoomLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) {
    return createRoomLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) {
    if (createRoomLoading != null) {
      return createRoomLoading(this);
    }
    return orElse();
  }
}

abstract class ChatRoomsStateCreateRoomLoading implements ChatRoomsState {
  const factory ChatRoomsStateCreateRoomLoading(final String id) =
      _$ChatRoomsStateCreateRoomLoading;

  String get id;
  @JsonKey(ignore: true)
  _$$ChatRoomsStateCreateRoomLoadingCopyWith<_$ChatRoomsStateCreateRoomLoading>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomsStateInitialCopyWith<$Res> {
  factory _$$ChatRoomsStateInitialCopyWith(_$ChatRoomsStateInitial value,
          $Res Function(_$ChatRoomsStateInitial) then) =
      __$$ChatRoomsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatRoomsStateInitialCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$ChatRoomsStateInitial>
    implements _$$ChatRoomsStateInitialCopyWith<$Res> {
  __$$ChatRoomsStateInitialCopyWithImpl(_$ChatRoomsStateInitial _value,
      $Res Function(_$ChatRoomsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatRoomsStateInitial implements ChatRoomsStateInitial {
  const _$ChatRoomsStateInitial();

  @override
  String toString() {
    return 'ChatRoomsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatRoomsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
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
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChatRoomsStateInitial implements ChatRoomsState {
  const factory ChatRoomsStateInitial() = _$ChatRoomsStateInitial;
}

/// @nodoc
abstract class _$$ChatRoomsStateSuccessCopyWith<$Res> {
  factory _$$ChatRoomsStateSuccessCopyWith(_$ChatRoomsStateSuccess value,
          $Res Function(_$ChatRoomsStateSuccess) then) =
      __$$ChatRoomsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String? force});
}

/// @nodoc
class __$$ChatRoomsStateSuccessCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$ChatRoomsStateSuccess>
    implements _$$ChatRoomsStateSuccessCopyWith<$Res> {
  __$$ChatRoomsStateSuccessCopyWithImpl(_$ChatRoomsStateSuccess _value,
      $Res Function(_$ChatRoomsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? force = freezed,
  }) {
    return _then(_$ChatRoomsStateSuccess(
      force: freezed == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatRoomsStateSuccess implements ChatRoomsStateSuccess {
  const _$ChatRoomsStateSuccess({this.force});

  @override
  final String? force;

  @override
  String toString() {
    return 'ChatRoomsState.success(force: $force)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsStateSuccess &&
            (identical(other.force, force) || other.force == force));
  }

  @override
  int get hashCode => Object.hash(runtimeType, force);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsStateSuccessCopyWith<_$ChatRoomsStateSuccess> get copyWith =>
      __$$ChatRoomsStateSuccessCopyWithImpl<_$ChatRoomsStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) {
    return success(force);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) {
    return success?.call(force);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(force);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ChatRoomsStateSuccess implements ChatRoomsState {
  const factory ChatRoomsStateSuccess({final String? force}) =
      _$ChatRoomsStateSuccess;

  String? get force;
  @JsonKey(ignore: true)
  _$$ChatRoomsStateSuccessCopyWith<_$ChatRoomsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomsStateCreateRoomSuccessCopyWith<$Res> {
  factory _$$ChatRoomsStateCreateRoomSuccessCopyWith(
          _$ChatRoomsStateCreateRoomSuccess value,
          $Res Function(_$ChatRoomsStateCreateRoomSuccess) then) =
      __$$ChatRoomsStateCreateRoomSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Conversations room});
}

/// @nodoc
class __$$ChatRoomsStateCreateRoomSuccessCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res,
        _$ChatRoomsStateCreateRoomSuccess>
    implements _$$ChatRoomsStateCreateRoomSuccessCopyWith<$Res> {
  __$$ChatRoomsStateCreateRoomSuccessCopyWithImpl(
      _$ChatRoomsStateCreateRoomSuccess _value,
      $Res Function(_$ChatRoomsStateCreateRoomSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$ChatRoomsStateCreateRoomSuccess(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Conversations,
    ));
  }
}

/// @nodoc

class _$ChatRoomsStateCreateRoomSuccess
    implements ChatRoomsStateCreateRoomSuccess {
  const _$ChatRoomsStateCreateRoomSuccess({required this.room});

  @override
  final Conversations room;

  @override
  String toString() {
    return 'ChatRoomsState.createRoomSuccess(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsStateCreateRoomSuccess &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsStateCreateRoomSuccessCopyWith<_$ChatRoomsStateCreateRoomSuccess>
      get copyWith => __$$ChatRoomsStateCreateRoomSuccessCopyWithImpl<
          _$ChatRoomsStateCreateRoomSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) {
    return createRoomSuccess(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) {
    return createRoomSuccess?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (createRoomSuccess != null) {
      return createRoomSuccess(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) {
    return createRoomSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) {
    return createRoomSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) {
    if (createRoomSuccess != null) {
      return createRoomSuccess(this);
    }
    return orElse();
  }
}

abstract class ChatRoomsStateCreateRoomSuccess implements ChatRoomsState {
  const factory ChatRoomsStateCreateRoomSuccess(
      {required final Conversations room}) = _$ChatRoomsStateCreateRoomSuccess;

  Conversations get room;
  @JsonKey(ignore: true)
  _$$ChatRoomsStateCreateRoomSuccessCopyWith<_$ChatRoomsStateCreateRoomSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomsStateErrorCopyWith<$Res> {
  factory _$$ChatRoomsStateErrorCopyWith(_$ChatRoomsStateError value,
          $Res Function(_$ChatRoomsStateError) then) =
      __$$ChatRoomsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ChatRoomsStateErrorCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$ChatRoomsStateError>
    implements _$$ChatRoomsStateErrorCopyWith<$Res> {
  __$$ChatRoomsStateErrorCopyWithImpl(
      _$ChatRoomsStateError _value, $Res Function(_$ChatRoomsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ChatRoomsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatRoomsStateError implements ChatRoomsStateError {
  const _$ChatRoomsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ChatRoomsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsStateErrorCopyWith<_$ChatRoomsStateError> get copyWith =>
      __$$ChatRoomsStateErrorCopyWithImpl<_$ChatRoomsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String id) createRoomLoading,
    required TResult Function() initial,
    required TResult Function(String? force) success,
    required TResult Function(Conversations room) createRoomSuccess,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String id)? createRoomLoading,
    TResult? Function()? initial,
    TResult? Function(String? force)? success,
    TResult? Function(Conversations room)? createRoomSuccess,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String id)? createRoomLoading,
    TResult Function()? initial,
    TResult Function(String? force)? success,
    TResult Function(Conversations room)? createRoomSuccess,
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
    required TResult Function(ChatRoomsStateLoading value) loading,
    required TResult Function(ChatRoomsStateCreateRoomLoading value)
        createRoomLoading,
    required TResult Function(ChatRoomsStateInitial value) initial,
    required TResult Function(ChatRoomsStateSuccess value) success,
    required TResult Function(ChatRoomsStateCreateRoomSuccess value)
        createRoomSuccess,
    required TResult Function(ChatRoomsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomsStateLoading value)? loading,
    TResult? Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult? Function(ChatRoomsStateInitial value)? initial,
    TResult? Function(ChatRoomsStateSuccess value)? success,
    TResult? Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult? Function(ChatRoomsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomsStateLoading value)? loading,
    TResult Function(ChatRoomsStateCreateRoomLoading value)? createRoomLoading,
    TResult Function(ChatRoomsStateInitial value)? initial,
    TResult Function(ChatRoomsStateSuccess value)? success,
    TResult Function(ChatRoomsStateCreateRoomSuccess value)? createRoomSuccess,
    TResult Function(ChatRoomsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatRoomsStateError implements ChatRoomsState {
  const factory ChatRoomsStateError({required final String error}) =
      _$ChatRoomsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ChatRoomsStateErrorCopyWith<_$ChatRoomsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
