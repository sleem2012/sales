import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../data/models/chat_model.dart';
import '../../data/models/chat_rooms_model.dart';
import '../../logic/rooms_bloc/chat_rooms_bloc.dart';
import '../../logic/rooms_bloc/chat_state.dart';
import '../chat_view.dart';

class KChatIconButton extends StatelessWidget {
  final ChatRoomType roomType;
  final int? room_type_id, room_user_id, room_id;
  final String? order_chat_type;
  final Function(Conversations)? onSuccess;

  const KChatIconButton({super.key, required this.roomType, this.room_type_id, this.room_user_id, this.order_chat_type, this.room_id, this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatRoomsBloc, ChatRoomsState>(
      listener: (context, state) {
        state.whenOrNull(
          createRoomSuccess: (room) {
            onSuccess?.call(room);
            Get.to(() => ChatView(room: room));
          },
        );
      },
      builder: (context, state) {
        return ClipOval(
          child: Material(
            color: KColors.accentColorL,
            child: InkWell(
              onTap: () {
                if (room_id != null) {
                  ChatRoomsBloc.of(context).get_room(room_id);
                } else {
                  ChatRoomsBloc.of(context).create_room(
                    roomType: roomType,
                    room_user_id: room_user_id,
                    room_type_id: room_type_id,
                    order_chat_type: order_chat_type,
                  );
                }
              },
              child: SizedBox(
                width: 30,
                height: 30,
                child: state.maybeWhen(
                  createRoomLoading: (id) => id == room_type_id.toString() || id == room_user_id.toString() || id == roomType.toString() || id == room_id.toString()
                      ? const Center(
                          child: SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          ),
                        )
                      : const Icon(KHelper.chat, color: Colors.white, size: 18),
                  orElse: () {
                    return const Icon(KHelper.chat, color: Colors.white, size: 18);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
