import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkwell/linkwell.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../views/widgets/photo_viewer.dart';
import '../../../widgets/relative_date_time.dart';
import '../../../../views/widgets/shimmer_box.dart';
import '../../../extensions.dart';
import '../../../shared/picker/view/static_map_view.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../widgets/icon_button.dart';
import '../../data/models/send_msg_model.dart';
import '../../logic/audio_player/audio_player_bloc.dart';
import '../../logic/audio_player/audio_player_event.dart';
import '../../logic/messages_helper.dart';
import '../../logic/msg_bloc/messages_bloc.dart';
import '../../logic/msg_bloc/send_msg_state.dart';

class ChatBubble extends StatefulWidget {
  final SendMsgModel msgModel;
  const ChatBubble({Key? key, required this.msgModel}) : super(key: key);
  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.msgModel.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 1.5),
          decoration: KHelper.of(context).msgBubble,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.msgModel.messageType != MessageType.text) VoiceBubble(msgModel: widget.msgModel),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: KHelper.width * .8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageMsgBubble(msgModel: widget.msgModel),
                    FileMsgBubble(msgModel: widget.msgModel),
                    if (widget.msgModel.messageType == MessageType.text) TextMsgBubble(msgModel: widget.msgModel),
                  ],
                ),
              ),
              widget.msgModel.created_at != null
                  ? RelativeDateTimeWidget(
                      dateTime: DateTime.tryParse(widget.msgModel.created_at ?? '') ?? DateTime.now(),
                      textStyle: KTextStyle.of(context).hint2,
                    )
                  : const Icon(Icons.schedule, size: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class TextMsgBubble extends StatelessWidget {
  const TextMsgBubble({Key? key, required this.msgModel}) : super(key: key);

  final SendMsgModel msgModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if ((msgModel.message?.text ?? '').isNotEmpty) {
      if (MsgHelper.isLocation(msgModel.message?.text)) {
        return SizedBox(
          width: width * .6,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: MapStaticView(
              latLng: MsgHelper.latLng(msgModel.message?.text),
            ),
          ),
        );
      } else {
        return LinkWell(
          msgModel.message?.text ?? '',
          style: MsgHelper.isAllEmoji(msgModel.message?.text ?? '') ? KTextStyle.of(context).headers.copyWith(fontSize: 30) : KTextStyle.of(context).body2,
        );
      }
    } else {
      return const SizedBox();
    }
  }
}

class FileMsgBubble extends StatefulWidget {
  const FileMsgBubble({Key? key, required this.msgModel}) : super(key: key);

  final SendMsgModel msgModel;

  @override
  State<FileMsgBubble> createState() => _FileMsgBubbleState();
}

class _FileMsgBubbleState extends State<FileMsgBubble> {
  @override
  Widget build(BuildContext context) {
    if (widget.msgModel.messageType == MessageType.file) {
      final fileName = widget.msgModel.message!.mediaName ?? "";
      final file = widget.msgModel.message!.media ?? "";
      return BlocBuilder<MessagesBloc, MessagesState>(
        buildWhen: (previous, current) {
          return current.maybeWhen(orElse: () => false, uploading: (url) => file == url);
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  if (!state.maybeWhen(orElse: () => false, uploading: (url) => file == url)) {
                    await launchUrlString(widget.msgModel.message!.media!, mode: LaunchMode.externalApplication);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.file_copy),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: Text(fileName, maxLines: 1, style: KTextStyle.of(context).body2),
                      ),
                    ),
                    if (state.maybeWhen(orElse: () => false, uploading: (url) => file == url))
                      const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())
                  ],
                ),
              ),
              if ((widget.msgModel.message?.text ?? '').isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextMsgBubble(msgModel: widget.msgModel),
                )
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}

class VoiceBubble extends StatefulWidget {
  const VoiceBubble({Key? key, required this.msgModel}) : super(key: key);

  final SendMsgModel msgModel;

  @override
  State<VoiceBubble> createState() => _VoiceBubbleState();
}

class _VoiceBubbleState extends State<VoiceBubble> {
  final barHList = List.generate(60, (index) => (math.Random().nextDouble() * 15) + 5);

  Widget _bar(double h, bool isW) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: .5),
      decoration: BoxDecoration(color: isW ? KColors.of(context).reBackground : Colors.grey, borderRadius: BorderRadius.circular(5)),
      height: h,
      width: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.msgModel.messageType == MessageType.voice) {
      return BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, msgState) {
          final voiceUrl = widget.msgModel.message!.media!;
          final voice_duration = widget.msgModel.message?.voice_duration ?? const Duration(milliseconds: 0);
          return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
            buildWhen: (previous, current) {
              return current.maybeWhen(orElse: () => false, playing: (url, value) => url == voiceUrl) ||
                  previous.maybeWhen(orElse: () => false, playing: (url, value) => url == voiceUrl);
            },
            builder: (context, player) {
              final isPlaying = player.maybeWhen(orElse: () => false, playing: (url, value) => url == voiceUrl);
              final Duration? duration = player.maybeWhen(orElse: () => null, playing: (url, duration) => duration);
              return Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: KColors.of(context).reBackground),
                      child: KIconButton(
                        onPressed: () {
                          AudioPlayerBloc.of(context).play(voiceUrl);
                        },
                        child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(duration?.toStrTime ?? "00:00", style: KTextStyle.of(context).body3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: barHList.map((h) {
                              final wBars = ((duration?.inMilliseconds ?? 0) / (voice_duration.inMilliseconds == 0 ? 1 : voice_duration.inMilliseconds)) *
                                  barHList.length;
                              return _bar(h, wBars > barHList.indexOf(h));
                            }).toList(),
                          ),
                          Positioned(
                            width: 120,
                            child: SliderTheme(
                              data: const SliderThemeData(
                                thumbColor: Colors.green,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                                trackHeight: 1,
                              ),
                              child: Slider(
                                value: math.min(voice_duration.inMilliseconds.toDouble(), duration?.inMilliseconds.toDouble() ?? 0),
                                max: math.max(voice_duration.inMilliseconds.toDouble(), duration?.inMilliseconds.toDouble() ?? 0),
                                min: 0,
                                thumbColor: isPlaying ? Colors.white : Colors.grey,
                                activeColor: Colors.white.withOpacity(0),
                                inactiveColor: Colors.white.withOpacity(0),
                                onChanged: (value) {
                                  // AudioPlayerBloc.of(context).seek( voiceUrl,  value.floor());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(voice_duration.toStrTime, style: KTextStyle.of(context).body3),
                  ],
                ),
              );
            },
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}

class ImageMsgBubble extends StatefulWidget {
  const ImageMsgBubble({Key? key, required this.msgModel}) : super(key: key);

  final SendMsgModel msgModel;

  @override
  State<ImageMsgBubble> createState() => _ImageMsgBubbleState();
}

class _ImageMsgBubbleState extends State<ImageMsgBubble> {
  @override
  Widget build(BuildContext context) {
    if (widget.msgModel.messageType == MessageType.image) {
      final img = widget.msgModel.message!.media!;
      final imgMsg = widget.msgModel.message!;
      return BlocBuilder<MessagesBloc, MessagesState>(
        buildWhen: (previous, current) {
          return current.maybeWhen(orElse: () => false, uploading: (url) => img == url);
        },
        builder: (context, state) {
        final  asp = (imgMsg.imgW ?? 1) / (imgMsg.imgH ?? 1);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(KHelper.cornerRadius),
                child: InkWell(
                  onTap: () {
                    if (!state.maybeWhen(orElse: () => false, uploading: (url) => img == url)) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Nav.to(KPhotoView(image: img));
                    }
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: KHelper.height * .3),
                    child: AspectRatio(
                      aspectRatio: asp > 0?asp : 1.0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (img.isURL)
                            Hero(
                              tag: FileImage(File(img)),
                              child: CachedNetworkImage(
                                imageUrl: img,
                                placeholder: (context, url) => ShimmerBox(height: imgMsg.imgW, width: imgMsg.imgH),
                              ),
                            )
                          else
                            Image.file(File(img)),
                          if (state.maybeWhen(orElse: () => false, uploading: (url) => img == url))
                            const Positioned(
                              child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if ((widget.msgModel.message?.text ?? '').isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextMsgBubble(msgModel: widget.msgModel),
                )
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
