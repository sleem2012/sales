import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../../packages/shared/error/failures.dart';
import '../models/chat_rooms_model.dart';
import '../models/send_msg_model.dart';
import '../models/chat_model.dart';
import "package:dartz/dartz.dart";
import "package:dio/dio.dart";
import '../../../../di.dart';

abstract class ChatRepoAbs {
  Future<Either<KFailure, Conversations>> create_room({required String room_type, int? room_type_id});
  Future<Either<KFailure, ChatMsgsModel>> get_chat({required int id});
  Future<Either<KFailure, SendMsgModel>> send_msg({required SendMsgModel msg});
  Future<Either<KFailure, ChatRoomsModel>> get_rooms();
  Future<Either<KFailure, Conversations>> get_room(int? id);
  Future<Either<KFailure, String>> upload_file({required MultipartFile file});
  Future<Either<KFailure, Conversations>> toggleRoomVisibility(int? id, bool is_visible);
}

class ChatRepoImp implements ChatRepoAbs {
  static ChatRepoImp? _instance;
  ChatRepoImp._internal() {
    _instance = this;
  }
  static ChatRepoImp get i {
    return _instance ?? ChatRepoImp._internal();
  }

  @override
  Future<Either<KFailure, ChatMsgsModel>> get_chat({int? id, int? page, int? page_count}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.chat_messages, params: {"room_id": id, "page": page, "page_count": page_count});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(ChatMsgsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Conversations>> create_room({required String room_type, int? room_type_id, int? room_user_id, String? order_chat_type}) async {
    final data = {
      'room_type': room_type,
      if (room_type_id != null) "room_type_id": room_type_id,
      if (room_user_id != null) "room_user_id": room_user_id,
      if (order_chat_type != null) "order_chat_type": order_chat_type,
    };
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.chat_room, data: data);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(Conversations.fromJson(r['data'])),
    );
  }

  @override
  Future<Either<KFailure, SendMsgModel>> send_msg({required SendMsgModel msg}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.chat_messages, data: msg.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SendMsgModel.fromJson(r["data"])),
    );
  }

  @override
  Future<Either<KFailure, ChatRoomsModel>> get_rooms() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.chat_members);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(ChatRoomsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, String>> upload_file({required MultipartFile file}) async {
    Response<dynamic> result = await Di.dioClient.postWithFiles(KEndPoints.upload_file, data: {"file": file});
    if (result.statusCode == 200) {
      return right(result.data.toString());
    } else {
      return left(KFailure.error(result.data.toString()));
    }
  }

  @override
  Future<Either<KFailure, Conversations>> get_room(int? id) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.chat_room, params: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(Conversations.fromJson(r['data'])),
    );
  }

  @override
  Future<Either<KFailure, Conversations>> toggleRoomVisibility(int? id, bool is_visible) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.chat_room, params: {"id": id, "is_archive": is_visible ? 1 : 0});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(Conversations.fromJson(r['data'])));
  }
}
