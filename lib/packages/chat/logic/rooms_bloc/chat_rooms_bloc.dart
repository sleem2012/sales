import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../cache/locale_storage.dart';
import '../../../extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import '../../data/models/chat_model.dart';
import '../../data/models/chat_rooms_model.dart';
import '../../data/models/send_msg_model.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';

class ChatRoomsBloc extends Cubit<ChatRoomsState> {
  ChatRoomsBloc() : super(const ChatRoomsState.initial()) {
    setup_rooms_socket();
  }

  List<Conversations> get rooms => filterAllRooms(false);
  List<Conversations> get archivedRooms => filterAllRooms(true);
  List<Conversations> get allRooms => archivedRooms + rooms;
  List<Conversations> filteredRooms = [];
  List<Conversations> filterAllRooms(bool arc) {
    return _roomsModel!.conversations!.where((element) => element.room?.is_archive == arc).toList();
  }

  static ChatRoomsBloc of(BuildContext context) => BlocProvider.of<ChatRoomsBloc>(context);

  final ChatRepoImp chatRepoImp = ChatRepoImp.i;
  ChatRoomsModel? _roomsModel = ChatRoomsModel(conversations: []);

  get isSearching => _isSearching;
  bool _isSearching = false;

  searchRoom(String p1) {
    if (p1.isNotEmpty) {
      _isSearching = true;
      filteredRooms = allRooms.where((element) {
        return element.nickname?.toLowerCase().trim().contains(p1.toLowerCase().trim()) ?? false;
      }).toList();
    } else {
      _isSearching = false;
      filteredRooms = allRooms;
    }
    _update;
  }

  get_all_rooms() async {
    try {
      emit(const ChatRoomsState.loading());
      final result = await chatRepoImp.get_rooms();
      result.fold(
        (l) {
          debugPrint('================= Chat Bloc : ${KFailure.toError(l)}');
          emit(ChatRoomsState.error(error: KFailure.toError(l)));
        },
        (r) {
          _roomsModel = r;
          emit(const ChatRoomsState.success());
        },
      );
    } catch (e) {
      debugPrint('================= Chat Bloc (Catch): ${e.toString()} ');
      emit(ChatRoomsState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  create_room({required ChatRoomType roomType, int? room_type_id, int? room_user_id, String? order_chat_type}) async {
    try {
      emit(ChatRoomsState.createRoomLoading("${room_type_id ?? room_user_id ?? roomType.toString()}"));
      final result = await chatRepoImp.create_room(
        room_type: roomType.toString(),
        room_type_id: room_type_id,
        room_user_id: room_user_id,
        order_chat_type: order_chat_type,
      );
      result.fold(
        (l) {
          debugPrint('================= Chat Bloc create_room : ${KFailure.toError(l)}');
          emit(ChatRoomsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= Chat Bloc create_room: ${r.toJson()}  ');
          _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?..insert(0, r));
          printMap(r.toJson());

          emit(ChatRoomsState.createRoomSuccess(room: r));
        },
      );
    } catch (e) {
      debugPrint('================= Chat Bloc (Catch): ${e.toString()} ');
      emit(ChatRoomsState.error(error: Tr.get.something_went_wrong));
    }
  }

  get_room(int? id) async {
    try {
      emit(ChatRoomsState.createRoomLoading("$id"));

      final availableRooms = _roomsModel?.conversations?.where((element) => element.roomId == id) ?? [];
      if (availableRooms.isNotEmpty) {
        emit(ChatRoomsState.createRoomSuccess(room: availableRooms.first));
        return;
      }

      final result = await chatRepoImp.get_room(id);
      result.fold(
        (l) {
          debugPrint('================= Chat Bloc create_room : ${KFailure.toError(l)}');
        },
        (r) {
          debugPrint('================= Chat Bloc create_room: ${r.toJson()}  ');
          _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?..insert(0, r));
          emit(ChatRoomsState.createRoomSuccess(room: r));
        },
      );
    } catch (e) {
      debugPrint('================= Chat Bloc (Catch): ${e.toString()} ');
    }
  }

  toggleRoomVisibility(int? id, bool is_visible) async {
    try {
      emit(const ChatRoomsState.loading());
      _toggle_room_visibility(id, is_visible);

      final result = await chatRepoImp.toggleRoomVisibility(id, is_visible);
      result.fold(
        (l) {
          debugPrint('================= ToggleRoomVisibility Bloc : ${KFailure.toError(l)}');
          emit(ChatRoomsState.error(error: KFailure.toError(l)));
          _toggle_room_visibility(id, !is_visible);
        },
        (r) {
          debugPrint('================= ToggleRoomVisibility Bloc : ${r.toString()}  ');
        },
      );
    } catch (e) {
      debugPrint('================= ToggleRoomVisibility Bloc (Catch): ${e.toString()} ');
    }
  }

  _toggle_room_visibility(int? id, bool is_visible) {
    final old_room = _roomsModel?.conversations?.firstWhereOrNull((element) => element.roomId == id);
    final updated_room = old_room?.copyWith(room: old_room.room?.copyWith(is_archive: is_visible));
    if (updated_room != null) {
      _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?.replaceWhere((element) => element.roomId == old_room?.roomId, updated_room));
      printMap(old_room?.room?.toJson());
      emit(const ChatRoomsState.success());
    }
  }

  setup_rooms_socket() {
    if (KStorage.i.getToken != null) {
      Di.socket.on('room-${KStorage.i.getUserInfo?.data?.id}', (data) => handle_room_event(data));
    }
  }

  handle_room_event(data) {
    final msg = SendMsgModel.fromJson(data["message"]);
    printMap(msg.toJson());
    Conversations? list = _roomsModel?.conversations?.firstWhereOrNull((element) => element.roomId == data["room"]);

    if (list != null) {
      final updated_room = list.copyWith(messagesCollection: list.messagesCollection?..insert(0, msg), unread_message: (list.unread_message ?? 0) + 1);
      _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?.replace(list, updated_room, 0));
      _update;
    } else {
      _roomsModel?.conversations?.removeWhere((element) => element.roomId == data["room"]);
      get_room(data["room"]);
    }
  }

  void setAllReadd(Conversations chatRoom) {
    final updated_room = chatRoom.copyWith(unread_message: 0);
    final updated_room_index = _roomsModel?.conversations?.indexOf(chatRoom) ?? 0;
    _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?.replace(chatRoom, updated_room, updated_room_index));
    _update;
  }

  int get unReaddMsgs {
    return _roomsModel?.conversations?.fold<int>(0, (previousValue, element) => previousValue + (element.unread_message ?? 0)) ?? 0;
  }

  get _update {
    emit(ChatRoomsState.success(force: UniqueKey().toString()));
  }

  void setLastMsg(int? rId, SendMsgModel? sendMsgModel) {
    if (rId != null) {
      final Conversations? list = _roomsModel?.conversations?.firstWhereOrNull((element) => element.roomId == rId);
      if (list != null) {
        final updated_room = list.copyWith(messagesCollection: list.messagesCollection?..insert(0, sendMsgModel!));
        _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?.replace(list, updated_room, 0));
        _update;
      }
    }
  }

  void updateMessages(List<SendMsgModel>? l, int? rId) {
    debugPrint('================= l = ${l?.length} : ');
    if (rId != null) {
      Conversations? list = _roomsModel?.conversations?.firstWhereOrNull((element) => element.roomId == rId);
      if (list != null) {
        final updated_room = list.copyWith(messagesCollection: l ?? []);
        _roomsModel = _roomsModel?.copyWith(rooms: _roomsModel?.conversations?.replace(list, updated_room, 0));
        _update;
      }
    }
  }
}
