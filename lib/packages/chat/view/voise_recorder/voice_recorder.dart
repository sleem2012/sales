import 'dart:io';
import 'dart:math';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';

import '../../../extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

class VoiceNoteRecorder extends StatefulWidget {
  const VoiceNoteRecorder({
    Key? key,
    required this.onSend,
    this.fieldDecoration,
    this.lockDecoration,
    this.btnDecoration,
    this.cancelWidget,
    this.lockColor,
    this.micSendColor,
    this.durationStyle,
    this.animationColor,
    this.animationColor2,
    this.onRecordingStateChanged,
    required this.recorder,
  }) : super(key: key);
  final BoxDecoration? fieldDecoration;
  final BoxDecoration? lockDecoration;
  final BoxDecoration? btnDecoration;
  final Color? lockColor;
  final Color? micSendColor;
  final Color? animationColor;
  final Color? animationColor2;
  final Widget? cancelWidget;
  final TextStyle? durationStyle;
  final Function(String? path, int? duration) onSend;
  final Function(bool isRecording)? onRecordingStateChanged;
  final FlutterSoundRecorder recorder;

  @override
  State<VoiceNoteRecorder> createState() => _VoiceNoteRecorderState();
}

class _VoiceNoteRecorderState extends State<VoiceNoteRecorder> with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 300);
  final GlobalKey cancelKey = GlobalKey();
  final GlobalKey lockKey = GlobalKey();
  bool isRecording = false;
  bool isLocked = false;
  bool isCanceled = false;
  bool isRecorderReady = false;
  double btnHorPos = 0.0;
  double btnVerPos = 0.0;
  Offset? _cancelPos;
  Offset? _lockPos;
  final double btnHight = 48.0;
  late AnimationController animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
  PermissionStatus? status;
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  bool get isRTL => Directionality.of(context) == TextDirection.rtl;
  int _duration = 0;
  final String _mPath = '${DateTime.now().millisecondsSinceEpoch}.mp4';

  @override
  void initState() {
    init_recorder();
    super.initState();
  }

  get positions {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cancelObj = cancelKey.currentContext?.findRenderObject();
      RenderBox? cancelBox;
      if (cancelObj != null) {
        cancelBox = cancelObj as RenderBox;
        _cancelPos = cancelBox.localToGlobal(Offset.zero);
      }
      final lockObj = cancelKey.currentContext?.findRenderObject();
      RenderBox? lockBox;
      if (lockObj != null) {
        lockBox = lockObj as RenderBox;
        _lockPos = lockBox.localToGlobal(Offset.zero);
      }
    });
  }

  init_recorder() async {
    status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      KHelper.showSnackBar(Tr.get.microphonePermissionNotGranted);
    }
    await widget.recorder.openRecorder();

    isRecorderReady = true;
    await widget.recorder.setSubscriptionDuration(const Duration(milliseconds: 200));
  }

  Future start_recorder() async {
    if (!isRecorderReady) return;
    if (status != null) {
      await widget.recorder.startRecorder(
        toFile: _mPath,
        //codec: Platform.isIOS ? Codec.aacMP4 : Codec.defaultCodec,
        sampleRate: 44100,
        bitRate: 128000,
        numChannels: 1,
      );
    } else {
      return;
    }
  }

  Future<String?> stop_recorder() async {
    final path = await widget.recorder.stopRecorder();
    debugPrint('================= file Path : >>> $path ');
    return path;
  }

  Future deleteRecorder() async {
    if (!isRecorderReady) return;
    final path = await widget.recorder.stopRecorder();
    if (path != null) {
      await widget.recorder.deleteRecord(fileName: path);
    }
  }

  stopRecording({required bool send}) async {
    if (isLocked) return;
    debugPrint('⏹================= Stop Recording   ⏹');
    if (widget.onRecordingStateChanged != null) {
      widget.onRecordingStateChanged!(false);
    }
    final path = await stop_recorder();
    if (send && !isCanceled) {
      sendRecord(path);
    }
    setState(() {});
    rest();
  }

  cancelRecording() {
    isRecording = false;
    isLocked = false;
    isCanceled = true;
    btnHorPos = 0.0;
    btnVerPos = 0.0;
    animationController.forward();
    setState(() {});
    deleteRecorder();
    if (widget.onRecordingStateChanged != null) {
      widget.onRecordingStateChanged!(false);
    }
    debugPrint('❌================= Cancel Recording ❌');
  }

  sendRecord(String? path) {
    final f = File.fromUri(Uri.parse(path ?? ""));
    debugPrint('📩================= Send Voice       📩 Duration = $_duration , $f ');
    widget.onSend(f.path, _duration);
    rest();
  }

  startRecording() {
    animationController.reset();
    if (isLocked && isRecording) {
      stopRecording(send: true);
      rest();
      return;
    }
    if (isRecording) return;
    positions;
    isRecording = true;
    setState(() {});
    if (widget.onRecordingStateChanged != null) {
      widget.onRecordingStateChanged!(false);
    }
    debugPrint('⏯================= Start Recording  ⏯');
    setupAudio();
    start_recorder();
  }

  void setupAudio() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions: AVAudioSessionCategoryOptions.allowBluetooth | AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy: AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ),);
  }

  lockRecorder() {
    if (!isLocked) {
      isRecording = true;
      isLocked = true;
      btnHorPos = 0.0;
      btnVerPos = 0.0;
      setState(() {});
      debugPrint('🔒================= Lock Recorder     🔒');
    }
  }

  rest() {
    isRecording = false;
    isLocked = false;
    isCanceled = false;
    btnHorPos = 0.0;
    btnVerPos = 0.0;
    setState(() {});
  }

  double get keyboardH {
    return (View.of(context).viewInsets.bottom > 0.0 ? MediaQueryData.fromView(View.of(context)).size.height - View.of(context).viewInsets.bottom : 0.0) * .75;
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    if (isRecording && !isLocked) {
      btnVerPos = (height - btnHight - details.globalPosition.dy) - keyboardH;
      var lockNewPos = height + btnHight / 2 - (_lockPos?.dy ?? 0.0) - keyboardH;
      positions;
      if (btnVerPos >= lockNewPos) {
        lockRecorder();
      }
      setState(() {});
    }
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    if (isRecording && !isLocked) {
      positions;
      if (isRTL) {
        btnHorPos = (details.globalPosition.dx - btnHight);
        debugPrint('$btnHorPos ================= ${(_cancelPos?.dx ?? 0.0).abs() - btnHight}');
        if (btnHorPos > (_cancelPos?.dx ?? 0.0).abs() - btnHight) {
          cancelRecording();
        }
      } else {
        btnHorPos = width - details.globalPosition.dx - btnHight;
        if (btnHorPos.toInt() >= ((width / 2) - btnHight * 2)) {
          cancelRecording();
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(height: height, width: width),
          Positioned(
            bottom: 0,
            left: isRTL ? 0 : null,
            right: isRTL ? null : 0,
            child: AnimatedContainer(
              duration: duration,
              height: btnHight,
              width: isRecording ? (width - 20) : btnHight,
              curve: Curves.decelerate,
              decoration: widget.fieldDecoration,
              child: isRecording
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: (width - 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 25,
                              child: Shimmer.fromColors(
                                baseColor: widget.animationColor ?? Colors.grey,
                                highlightColor: widget.animationColor2 ?? Colors.grey.shade200,
                                child: const Icon(Icons.mic, size: 24, color: Colors.red),
                              ),
                            ),
                            StreamBuilder<RecordingDisposition>(
                              stream: widget.recorder.onProgress,
                              builder: (context, snapshot) {
                                final duration = snapshot.hasData ? snapshot.data!.duration : Duration.zero;
                                _duration = duration.inMilliseconds;
                                return Text(duration.toStrTime, style: widget.durationStyle);
                              },
                            ),
                            InkWell(
                              onTapDown: (details) => cancelRecording(),
                              child: Center(
                                key: cancelKey,
                                child: Shimmer.fromColors(
                                  baseColor: widget.animationColor ?? Colors.grey,
                                  highlightColor: widget.animationColor2 ?? Colors.grey.shade200,
                                  child: widget.cancelWidget ?? const Text('Cancel'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 50)
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            bottom: isRecording ? 105 : 0,
            left: isRTL ? 0 : null,
            right: isRTL ? null : 0,
            curve: Curves.decelerate,
            duration: duration,
            child: Container(
              height: btnHight,
              width: btnHight,
              key: lockKey,
              decoration: widget.lockDecoration,
              child: Icon(isLocked ? Icons.lock : Icons.lock_open, color: widget.lockColor),
            ),
          ),
          Positioned(
            bottom: btnVerPos,
            left: isRTL ? btnHorPos : null,
            right: isRTL ? null : btnHorPos,
            child: GestureDetector(
              onTapDown: (details) => startRecording(),
              onTapUp: (details) => stopRecording(send: true),
              onHorizontalDragEnd: (details) => stopRecording(send: true),
              onVerticalDragEnd: (details) => stopRecording(send: true),
              onHorizontalDragUpdate: onHorizontalDragUpdate,
              onVerticalDragUpdate: onVerticalDragUpdate,
              child: AnimatedContainer(
                duration: duration,
                height: btnHight,
                width: btnHight,
                decoration: widget.btnDecoration,
                child: Icon(isRecording ? Icons.send : Icons.mic, color: widget.micSendColor, size: 24),
              ),
            ),
          ),
          Positioned(
            bottom: -(btnHight / 4),
            right: isRTL ? (btnHight / 4) : null,
            left: isRTL ? null : (btnHight / 4),
            child: Visibility(
              visible: animationController.isAnimating,
              child: RecordDeleteAnimation(animationController: animationController),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

/// **************************************************************************************
class RecordDeleteAnimation extends StatefulWidget {
  const RecordDeleteAnimation({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  State<RecordDeleteAnimation> createState() => _RecordDeleteAnimationState();
}

class _RecordDeleteAnimationState extends State<RecordDeleteAnimation> with SingleTickerProviderStateMixin {
  //Mic
  late Animation<double> _micTranslateTop;
  late Animation<double> _micRotationFirst;
  late Animation<double> _micTranslateRight;
  late Animation<double> _micTranslateLeft;
  late Animation<double> _micRotationSecond;
  late Animation<double> _micTranslateDown;
  late Animation<double> _micInsideTrashTranslateDown;

  late Animation<double> _trashWithCoverTranslateTop;
  late Animation<double> _trashCoverRotationFirst;
  late Animation<double> _trashCoverTranslateLeft;
  late Animation<double> _trashCoverRotationSecond;
  late Animation<double> _trashCoverTranslateRight;
  late Animation<double> _trashWithCoverTranslateDown;

  @override
  void initState() {
    super.initState();

    //Mic
    _micTranslateTop = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
      ),
    );
    _micRotationFirst = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.0, 0.2),
      ),
    );
    _micTranslateRight = Tween(begin: 0.0, end: 13.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.0, 0.1),
      ),
    );
    _micTranslateLeft = Tween(begin: 0.0, end: -13.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.1, 0.2),
      ),
    );
    _micRotationSecond = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.2, 0.45),
      ),
    );
    _micTranslateDown = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.45, 0.79, curve: Curves.easeInOut),
      ),
    );
    _micInsideTrashTranslateDown = Tween(begin: 0.0, end: 55.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.95, 1.0, curve: Curves.easeInOut),
      ),
    );
    //Trash Can
    _trashWithCoverTranslateTop = Tween(begin: 30.0, end: -25.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.45, 0.6),
      ),
    );
    _trashCoverRotationFirst = Tween(begin: 0.0, end: -pi / 3).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.6, 0.7),
      ),
    );
    _trashCoverTranslateLeft = Tween(begin: 0.0, end: -18.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.6, 0.7),
      ),
    );
    _trashCoverRotationSecond = Tween(begin: 0.0, end: pi / 3).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.8, 0.9),
      ),
    );
    _trashCoverTranslateRight = Tween(begin: 0.0, end: 18.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.8, 0.9),
      ),
    );
    _trashWithCoverTranslateDown = Tween(begin: 0.0, end: 55.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.95, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0)
                  ..translate(_micTranslateRight.value)
                  ..translate(_micTranslateLeft.value)
                  ..translate(0.0, _micTranslateTop.value)
                  ..translate(0.0, _micTranslateDown.value)
                  ..translate(0.0, _micInsideTrashTranslateDown.value),
                child: Transform.rotate(
                  angle: _micRotationFirst.value,
                  child: Transform.rotate(angle: _micRotationSecond.value, child: child),
                ),
              );
            },
            child: const Icon(Icons.mic, size: 24),
          ),
          AnimatedBuilder(
            animation: _trashWithCoverTranslateTop,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, _trashWithCoverTranslateTop.value)
                  ..translate(0.0, _trashWithCoverTranslateDown.value),
                child: child,
              );
            },
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _trashCoverRotationFirst,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(_trashCoverTranslateLeft.value)
                        ..translate(_trashCoverTranslateRight.value),
                      child: Transform.rotate(
                        angle: _trashCoverRotationSecond.value,
                        child: Transform.rotate(
                          angle: _trashCoverRotationFirst.value,
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: const Image(image: AssetImage('assets/images/trash_cover.png'), width: 24),
                ),
                const Image(image: AssetImage('assets/images/trash_container.png'), width: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
