// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioPlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String url, Duration? duration) playing,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String url, Duration? duration)? playing,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String url, Duration? duration)? playing,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AudioPlayerStateInitial value) initial,
    required TResult Function(_AudioPlayerStatePlaying value) playing,
    required TResult Function(_AudioPlayerStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AudioPlayerStateInitial value)? initial,
    TResult? Function(_AudioPlayerStatePlaying value)? playing,
    TResult? Function(_AudioPlayerStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AudioPlayerStateInitial value)? initial,
    TResult Function(_AudioPlayerStatePlaying value)? playing,
    TResult Function(_AudioPlayerStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) then) =
      _$AudioPlayerStateCopyWithImpl<$Res, AudioPlayerState>;
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res, $Val extends AudioPlayerState>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AudioPlayerStateInitialCopyWith<$Res> {
  factory _$$_AudioPlayerStateInitialCopyWith(_$_AudioPlayerStateInitial value,
          $Res Function(_$_AudioPlayerStateInitial) then) =
      __$$_AudioPlayerStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AudioPlayerStateInitialCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$_AudioPlayerStateInitial>
    implements _$$_AudioPlayerStateInitialCopyWith<$Res> {
  __$$_AudioPlayerStateInitialCopyWithImpl(_$_AudioPlayerStateInitial _value,
      $Res Function(_$_AudioPlayerStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AudioPlayerStateInitial implements _AudioPlayerStateInitial {
  const _$_AudioPlayerStateInitial();

  @override
  String toString() {
    return 'AudioPlayerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlayerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String url, Duration? duration) playing,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String url, Duration? duration)? playing,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String url, Duration? duration)? playing,
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
    required TResult Function(_AudioPlayerStateInitial value) initial,
    required TResult Function(_AudioPlayerStatePlaying value) playing,
    required TResult Function(_AudioPlayerStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AudioPlayerStateInitial value)? initial,
    TResult? Function(_AudioPlayerStatePlaying value)? playing,
    TResult? Function(_AudioPlayerStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AudioPlayerStateInitial value)? initial,
    TResult Function(_AudioPlayerStatePlaying value)? playing,
    TResult Function(_AudioPlayerStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AudioPlayerStateInitial implements AudioPlayerState {
  const factory _AudioPlayerStateInitial() = _$_AudioPlayerStateInitial;
}

/// @nodoc
abstract class _$$_AudioPlayerStatePlayingCopyWith<$Res> {
  factory _$$_AudioPlayerStatePlayingCopyWith(_$_AudioPlayerStatePlaying value,
          $Res Function(_$_AudioPlayerStatePlaying) then) =
      __$$_AudioPlayerStatePlayingCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, Duration? duration});
}

/// @nodoc
class __$$_AudioPlayerStatePlayingCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$_AudioPlayerStatePlaying>
    implements _$$_AudioPlayerStatePlayingCopyWith<$Res> {
  __$$_AudioPlayerStatePlayingCopyWithImpl(_$_AudioPlayerStatePlaying _value,
      $Res Function(_$_AudioPlayerStatePlaying) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? duration = freezed,
  }) {
    return _then(_$_AudioPlayerStatePlaying(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$_AudioPlayerStatePlaying implements _AudioPlayerStatePlaying {
  const _$_AudioPlayerStatePlaying({required this.url, this.duration});

  @override
  final String url;
  @override
  final Duration? duration;

  @override
  String toString() {
    return 'AudioPlayerState.playing(url: $url, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlayerStatePlaying &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPlayerStatePlayingCopyWith<_$_AudioPlayerStatePlaying>
      get copyWith =>
          __$$_AudioPlayerStatePlayingCopyWithImpl<_$_AudioPlayerStatePlaying>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String url, Duration? duration) playing,
    required TResult Function(String error) error,
  }) {
    return playing(url, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String url, Duration? duration)? playing,
    TResult? Function(String error)? error,
  }) {
    return playing?.call(url, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String url, Duration? duration)? playing,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(url, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AudioPlayerStateInitial value) initial,
    required TResult Function(_AudioPlayerStatePlaying value) playing,
    required TResult Function(_AudioPlayerStateError value) error,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AudioPlayerStateInitial value)? initial,
    TResult? Function(_AudioPlayerStatePlaying value)? playing,
    TResult? Function(_AudioPlayerStateError value)? error,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AudioPlayerStateInitial value)? initial,
    TResult Function(_AudioPlayerStatePlaying value)? playing,
    TResult Function(_AudioPlayerStateError value)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class _AudioPlayerStatePlaying implements AudioPlayerState {
  const factory _AudioPlayerStatePlaying(
      {required final String url,
      final Duration? duration}) = _$_AudioPlayerStatePlaying;

  String get url;
  Duration? get duration;
  @JsonKey(ignore: true)
  _$$_AudioPlayerStatePlayingCopyWith<_$_AudioPlayerStatePlaying>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AudioPlayerStateErrorCopyWith<$Res> {
  factory _$$_AudioPlayerStateErrorCopyWith(_$_AudioPlayerStateError value,
          $Res Function(_$_AudioPlayerStateError) then) =
      __$$_AudioPlayerStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_AudioPlayerStateErrorCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$_AudioPlayerStateError>
    implements _$$_AudioPlayerStateErrorCopyWith<$Res> {
  __$$_AudioPlayerStateErrorCopyWithImpl(_$_AudioPlayerStateError _value,
      $Res Function(_$_AudioPlayerStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_AudioPlayerStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AudioPlayerStateError implements _AudioPlayerStateError {
  const _$_AudioPlayerStateError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AudioPlayerState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlayerStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPlayerStateErrorCopyWith<_$_AudioPlayerStateError> get copyWith =>
      __$$_AudioPlayerStateErrorCopyWithImpl<_$_AudioPlayerStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String url, Duration? duration) playing,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String url, Duration? duration)? playing,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String url, Duration? duration)? playing,
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
    required TResult Function(_AudioPlayerStateInitial value) initial,
    required TResult Function(_AudioPlayerStatePlaying value) playing,
    required TResult Function(_AudioPlayerStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AudioPlayerStateInitial value)? initial,
    TResult? Function(_AudioPlayerStatePlaying value)? playing,
    TResult? Function(_AudioPlayerStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AudioPlayerStateInitial value)? initial,
    TResult Function(_AudioPlayerStatePlaying value)? playing,
    TResult Function(_AudioPlayerStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AudioPlayerStateError implements AudioPlayerState {
  const factory _AudioPlayerStateError(final String error) =
      _$_AudioPlayerStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$_AudioPlayerStateErrorCopyWith<_$_AudioPlayerStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
