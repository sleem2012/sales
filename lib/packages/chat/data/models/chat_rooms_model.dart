import 'package:flutter/foundation.dart';
import 'send_msg_model.dart';

class ChatRoomsModel {
  bool? success;
  String? status;
  String? message;
  List<Conversations>? conversations;

  ChatRoomsModel({this.success, this.status, this.message, this.conversations});

  ChatRoomsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      conversations = <Conversations>[];
      json['data'].forEach((v) {
        conversations!.add(Conversations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (conversations != null) {
      data['data'] = conversations!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ChatRoomsModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<Conversations>? rooms,
  }) {
    return ChatRoomsModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      conversations: rooms ?? conversations,
    );
  }

  @override
  bool operator ==(covariant ChatRoomsModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.conversations, conversations);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ conversations.hashCode;
  }
}

class Conversations {
  String? nickname;
  int? roomId;
  int? userId;
  int? unread_message;
  String? userType;
  Room? room;
  List<SendMsgModel>? messagesCollection;
  String? createdAt;
  bool? is_visible;

  Conversations({
    this.nickname,
    this.roomId,
    this.userId,
    this.userType,
    this.room,
    this.messagesCollection,
    this.createdAt,
    this.unread_message,
    this.is_visible,
  });

  Conversations.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    roomId = json['room_id'];
    userId = json['user_id'];
    userType = json['user_type'];
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
    if (json['messages_collection'] != null) {
      messagesCollection = <SendMsgModel>[];
      json['messages_collection'].forEach((v) {
        messagesCollection!.add(SendMsgModel.fromJson(v));
      });
    } else {
      messagesCollection = <SendMsgModel>[];
    }
    createdAt = json['created_at'];
    unread_message = json['unread_message'];
    is_visible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['room_id'] = roomId;
    data['user_id'] = userId;
    data['user_type'] = userType;
    if (room != null) {
      data['room'] = room!.toJson();
    }
    if (messagesCollection != null) {
      data['messages_collection'] = messagesCollection!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['unread_message'] = unread_message;
    data['is_visible'] = is_visible;
    return data;
  }

  Conversations copyWith({
    int? id,
    String? nickname,
    int? roomId,
    int? userId,
    int? unread_message,
    String? userType,
    Room? room,
    List<SendMsgModel>? messagesCollection,
    String? createdAt,
    bool? is_visible,
  }) {
    return Conversations(
      nickname: nickname ?? this.nickname,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      room: room ?? this.room,
      messagesCollection: messagesCollection ?? this.messagesCollection,
      createdAt: createdAt ?? this.createdAt,
      unread_message: unread_message ?? this.unread_message,
      is_visible: is_visible ?? this.is_visible,
    );
  }

  @override
  bool operator ==(covariant Conversations other) {
    if (identical(this, other)) return true;

    return other.nickname == nickname &&
        other.roomId == roomId &&
        other.userId == userId &&
        other.unread_message == unread_message &&
        other.userType == userType &&
        other.room == room &&
        listEquals(other.messagesCollection, messagesCollection) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return nickname.hashCode ^
        roomId.hashCode ^
        userId.hashCode ^
        unread_message.hashCode ^
        userType.hashCode ^
        room.hashCode ^
        messagesCollection.hashCode ^
        createdAt.hashCode;
  }
}

class Room {
  int? id;
  int? userId;
  String? name;
  String? icon;
  String? createdAt;
  bool? is_archive;

  Room({this.id, this.userId, this.name, this.icon, this.createdAt, this.is_archive});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    is_archive = json['is_archive'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['icon'] = icon;
    data['created_at'] = createdAt;
    data['is_archive'] = is_archive;
    return data;
  }

  Room copyWith({
    int? id,
    int? userId,
    String? name,
    String? icon,
    String? createdAt,
    bool? is_archive,
  }) {
    return Room(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      is_archive: is_archive ?? this.is_archive,
    );
  }

  @override
  bool operator ==(covariant Room other) {
    if (identical(this, other)) return true;

    return other.id == id && other.userId == userId && other.name == name && other.icon == icon && other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ name.hashCode ^ icon.hashCode ^ createdAt.hashCode;
  }
}
