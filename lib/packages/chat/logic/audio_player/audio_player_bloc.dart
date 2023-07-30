import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_player_event.dart';

class AudioPlayerBloc extends Cubit<AudioPlayerState> {
  final AudioPlayer audioPlayer = AudioPlayer();

  AudioPlayerBloc() : super(const AudioPlayerState.initial()) {
    _playerStateStream();
    if (Platform.isIOS) {
      audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    }
  }
  static AudioPlayerBloc of(BuildContext context) {
    return BlocProvider.of<AudioPlayerBloc>(context);
  }

  String nowPlaying = '';

  Future play(String url) async {
    emit(const AudioPlayerState.initial());
    _playerDurationStream();
    if (nowPlaying == url && audioPlayer.state == PlayerState.playing) {
      final cd = await audioPlayer.getCurrentPosition();
      emit(AudioPlayerState.playing(url: '', duration: cd));
      await audioPlayer.pause();
      return;
    }
    if (nowPlaying == url && audioPlayer.state == PlayerState.paused) {
      await audioPlayer.resume();
      nowPlaying = url;
      emit(AudioPlayerState.playing(url: url));
      return;
    }
    try {
      await audioPlayer.stop();
      nowPlaying = url;
      emit(AudioPlayerState.playing(url: url));
      await audioPlayer.play(UrlSource(url));
    } catch (e) {
      audioPlayer.stop();
      emit(const AudioPlayerState.playing(url: ''));
      debugPrint('playing audio error : $e');
    }
  }

  _playerStateStream() {
    debugPrint('*** player State Stream listener is active *** ');
    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.completed) {
        nowPlaying = '';
        audioPlayer.stop();
        emit(const AudioPlayerState.playing(url: ''));
      }
    });
  }

  FutureOr<void> seek(String url, int duration) async {
    if (audioPlayer.state != PlayerState.playing) {
      await play(url);
    }
    audioPlayer.seek(Duration(milliseconds: duration));
    emit(AudioPlayerState.playing(url: url, duration: Duration(milliseconds: duration.floor())));
  }

  Timer? duTimer;

  _playerDurationStream() {
    audioPlayer.onPositionChanged.listen((duration) {
      if (!(duTimer?.isActive ?? false)) {
        duTimer = Timer(
          const Duration(milliseconds: 30),
          () {
            update(state.maybeWhen(orElse: () => '', playing: (url, value) => url), duration);
          },
        );
      }
    });
  }

  FutureOr<void> update(String url, Duration duration) {
    emit(AudioPlayerState.playing(url: url, duration: duration));
  }

  cancelSub() {
    debugPrint('*** Audio player disposed ***');
    audioPlayer.dispose();
  }

  @override
  Future<void> close() {
    cancelSub();
    return super.close();
  }
}
