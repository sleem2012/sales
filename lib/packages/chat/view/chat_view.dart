import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../views/widgets/appbar.dart';
import '../../../views/widgets/load_more_wrapper.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/new_bg_img.dart';
import '../../../views/widgets/rect_getter/rec_getter.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../data/models/chat_rooms_model.dart';
import '../logic/audio_player/audio_player_bloc.dart';
import '../logic/msg_bloc/messages_bloc.dart';
import '../logic/msg_bloc/send_msg_state.dart';
import '../logic/rooms_bloc/chat_rooms_bloc.dart';
import 'voise_recorder/voice_recorder.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_text_field.dart';

class ChatView extends StatefulWidget {
  final Conversations? room;

  const ChatView({Key? key, this.room}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final GlobalKey textFKey = GlobalKey();
  double get tfHeight {
    double h = 73.0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final obj = textFKey.currentContext?.findRenderObject();
      RenderBox? box;
      if (obj != null) {
        box = obj as RenderBox;
        h = box.size.height;
      }
    });
    return h;
  }

  GlobalKey<RectGetterState> listViewKey = RectGetter.createGlobalKey();
  final _keys = {};
  List<int> get getVisible {
    var rect = RectGetter.getRectFromKey(listViewKey);
    var items = <int>[];
    _keys.forEach((index, key) {
      var itemRect = RectGetter.getRectFromKey(key);
      if (itemRect != null && !(itemRect.top > rect!.bottom || itemRect.bottom < rect.top)) items.add(index);
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AudioPlayerBloc()),
        BlocProvider(create: (context) => MessagesBloc()..setMessages(widget.room)),
      ],
      child: Scaffold(
        appBar: KAppBar(title: widget.room?.nickname ?? ''),
        body: BgImg(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  BlocConsumer<MessagesBloc, MessagesState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (rId, sendMsgModel) {
                          ChatRoomsBloc.of(context).setLastMsg(rId, sendMsgModel);
                        },
                      );
                    },
                    buildWhen: (previous, current) {
                      return current.maybeWhen(orElse: () => true, showRecorder: (v) => false, updateDate: (v) => false);
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: KRequestOverlay(
                          isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                          error: state.whenOrNull(error: (error) => error),
                          onTryAgain: () => MessagesBloc.of(context).get_all_msg(widget.room?.roomId),
                          child: RectGetter(
                            rectKey: listViewKey,
                            child: NotificationListener<ScrollUpdateNotification>(
                              onNotification: (notification) {
                                MessagesBloc.of(context).getCurrentDate(getVisible);
                                return true;
                              },
                              child: LoadMoreWrapper(
                                padding: EdgeInsets.zero.copyWith(top: 10),
                                itemCount: MessagesBloc.of(context).chatModel?.data?.length ?? 0,
                                reverse: true,
                                addAutomaticKeepAlives: true,
                                crossAxisCount: 1,
                                isLoadingMore: false,
                                onLoadMore: () async => await MessagesBloc.of(context).get_all_msg(widget.room?.roomId),
                                itemBuilder: (context, index) {
                                  _keys[index] = RectGetter.createGlobalKey();
                                  return RectGetter(
                                    rectKey: _keys[index],
                                    child: ChatBubble(msgModel: MessagesBloc.of(context).chatModel!.data![index]),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<MessagesBloc, MessagesState>(
                    builder: (context, state) {
                      return ChatTextField(key: textFKey, hideSend: MessagesBloc.of(context).showRecorder);
                    },
                  ),
                ],
              ),
              BlocBuilder<MessagesBloc, MessagesState>(
                builder: (context, rec) {
                  return Visibility(
                    visible: MessagesBloc.of(context).showRecorder,
                    child: VoiceNoteRecorder(
                      recorder: MessagesBloc.of(context).recorder,
                      fieldDecoration: BoxDecoration(color: KColors.of(context).accentColor, borderRadius: BorderRadius.circular(48)),
                      lockDecoration: BoxDecoration(color: KColors.of(context).accentColor, borderRadius: BorderRadius.circular(48)),
                      animationColor: Colors.black,
                      animationColor2: Colors.grey.shade500,
                      micSendColor: Colors.white,
                      lockColor: Colors.white,
                      btnDecoration: KHelper.of(context).circle(KColors.accentColorD),
                      onSend: MessagesBloc.of(context).send_voice,
                    ),
                  );
                },
              ),
              Positioned(
                top: 5,
                child: BlocSelector<MessagesBloc, MessagesState, String?>(
                  selector: (state) => state.whenOrNull(updateDate: (groupedDate) => groupedDate),
                  builder: (context, state) {
                    if (state != null) {
                      return Container(
                        decoration: KHelper.of(context).elevatedBox,
                        padding: const EdgeInsets.all(8),
                        child: Text(state, style: KTextStyle.of(context).hint2),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
