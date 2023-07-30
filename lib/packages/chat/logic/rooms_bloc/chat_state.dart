import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/chat_rooms_model.dart';

part 'chat_state.freezed.dart';



@freezed
class ChatRoomsState with _$ChatRoomsState {
  const factory ChatRoomsState.loading() = ChatRoomsStateLoading;
  const factory ChatRoomsState.createRoomLoading(String id) = ChatRoomsStateCreateRoomLoading;
  const factory ChatRoomsState.initial() = ChatRoomsStateInitial;
  const factory ChatRoomsState.success({String? force}) = ChatRoomsStateSuccess;
  const factory ChatRoomsState.createRoomSuccess({required Conversations room}) = ChatRoomsStateCreateRoomSuccess;
  const factory ChatRoomsState.error({required String error}) = ChatRoomsStateError;
}

// flutter pub run build_runner watch --delete-conflicting-outputs