import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../widgets/relative_date_time.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../widgets/slide_panel.dart';
import '../../data/models/chat_rooms_model.dart';
import '../../data/models/send_msg_model.dart';
import '../../logic/messages_helper.dart';
import '../../logic/rooms_bloc/chat_rooms_bloc.dart';
import '../chat_view.dart';
import 'un_readed_msg_badge.dart';

class ConversationTile extends StatelessWidget {
  final Conversations chatRoom;
  const ConversationTile({Key? key, required this.chatRoom}) : super(key: key);

  SendMsgModel? get stMsg => chatRoom.messagesCollection!.firstOrNull;

  String? get last_msg => stMsg?.messageType != MessageType.text ? stMsg?.messageType.toString() : stMsg?.message?.text;
  String? get last_msg_created => stMsg?.created_at.toString();

  @override
  Widget build(BuildContext context) {
    final is_archive = (chatRoom.room?.is_archive ?? true);

    return Container(
      decoration: KHelper.of(context).elevatedBox,
      margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      child: Slidable(
        key: Key(chatRoom.roomId.toString()),
        startActionPane: !is_archive
            ? actionPane(
                Icons.close,
                Colors.red,
                () => ChatRoomsBloc.of(context).toggleRoomVisibility(chatRoom.roomId, !is_archive),
              )
            : null,
        endActionPane: is_archive
            ? actionPane(
                Icons.check,
                KColors.accentColorD,
                () => ChatRoomsBloc.of(context).toggleRoomVisibility(chatRoom.roomId, !is_archive),
              )
            : null,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          title: Text(chatRoom.nickname ?? '', style: KTextStyle.of(context).listTileTitle),
          onTap: () {
            ChatRoomsBloc.of(context).setAllReadd(chatRoom);
            Get.to(() => ChatView(room: chatRoom));
          },
          leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(chatRoom.room?.icon ?? dummyNetLogo)),
          subtitle: MsgHelper.isLocation(last_msg)
              ? Row(
                  children: [
                    const Icon(Icons.location_pin, size: 12),
                    const SizedBox(width: 3),
                    Text(Tr.get.location, style: KTextStyle.of(context).body3),
                  ],
                )
              : Text(
                  last_msg?.capitalize ?? "",
                  style: KTextStyle.of(context).listTileSub,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              UnReadedCountBadge(count: chatRoom.unread_message ?? 0),
              RelativeDateTimeWidget(
                dateTime: DateTime.tryParse(last_msg_created ?? chatRoom.createdAt ?? '') ?? DateTime.now(),
                textStyle: KTextStyle.of(context).body3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
