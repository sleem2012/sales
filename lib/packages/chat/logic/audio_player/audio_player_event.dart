import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_player_event.freezed.dart';

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState.initial() = _AudioPlayerStateInitial;
  const factory AudioPlayerState.playing({required String url,  Duration? duration}) = _AudioPlayerStatePlaying;
  const factory AudioPlayerState.error(String error) = _AudioPlayerStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

