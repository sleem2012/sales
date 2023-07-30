// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

import '../../../../di.dart';
import '../../../cache/locale_storage.dart';
import '../../../modules/models/user_info/user_model.dart';

class SendMsgModel {
  int? roomId;
  UniqueKey? key;
  MsgContent? message;
  MessageType? messageType;
  bool? isRead;
  bool? isVisible;
  MsgSender? sender;
  int? parentId;
  String? created_at;
  bool get isMe => sender?.id == KStorage.i.getUserInfo?.data?.id;

  SendMsgModel({
    this.roomId,
    this.message,
    this.messageType,
    this.isRead,
    this.isVisible,
    this.parentId,
    this.created_at,
    this.sender,
    this.key,
  });

  SendMsgModel.fromJson(Map<String, dynamic> map) {
    roomId = int.tryParse(map['room_id'].toString());
    message = MsgContent.fromJson(map['message']);
    messageType = MessageType.fromStr(map['message_type'].toString());
    isRead = map['is_read'];
    isVisible = map['is_visible'];
    parentId = map['parent_id'];
    created_at = map["created_at"];
    sender = map["user"] != null ? MsgSender.fromJson(map["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['created_at'] = created_at;
    data['message'] = message?.toJson();
    data['message_type'] = messageType?.toString();
    data['user'] = sender?.toJson();
    if (isRead != null) {
      data['is_read'] = isRead;
    }
    if (isVisible != null) {
      data['is_visible'] = isVisible;
    }
    if (parentId != null) {
      data['parent_id'] = parentId;
    }
    return data;
  }

  SendMsgModel copyWith({
    int? roomId,
    MsgContent? message,
    MessageType? messageType,
    UniqueKey? key,
    bool? isRead,
    bool? isVisible,
    int? parentId,
    String? created_at,
    MsgSender? sender,
  }) {
    return SendMsgModel(
      roomId: roomId ?? this.roomId,
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
      isRead: isRead ?? this.isRead,
      isVisible: isVisible ?? this.isVisible,
      parentId: parentId ?? this.parentId,
      created_at: created_at ?? this.created_at,
      key: key ?? this.key ?? UniqueKey(),
      sender: sender ?? this.sender,
    );
  }

  @override
  String toString() {
    return 'SendMsgModel(roomId: $roomId, message: $message, messageType: $messageType, isRead: $isRead, isVisible: $isVisible, parentId: $parentId, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant SendMsgModel other) {
    if (identical(this, other)) return true;

    return other.roomId == roomId &&
        other.key == key &&
        other.message == message &&
        other.messageType == messageType &&
        other.isRead == isRead &&
        other.isVisible == isVisible &&
        other.sender == sender &&
        other.parentId == parentId &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return roomId.hashCode ^
        key.hashCode ^
        message.hashCode ^
        messageType.hashCode ^
        isRead.hashCode ^
        isVisible.hashCode ^
        sender.hashCode ^
        parentId.hashCode ^
        created_at.hashCode;
  }
}

class MsgSender {
  int? id;
  String? name;
  String? email;
  UserImage? image;

  MsgSender({this.id, this.name, this.email, this.image});

  MsgSender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    // data['image'] = image?.toJson();
    return data;
  }

  @override
  bool operator ==(covariant MsgSender other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email && other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ image.hashCode;
  }
}

abstract class MessageType {
  const MessageType();

  static const MessageType text = _TextMsg();
  static const MessageType file = _FileMsg();
  static const MessageType voice = _VoiceMsg();
  static const MessageType image = _ImageMsg();

  static List<MessageType> types = [text, file, voice, image];

  factory MessageType.fromStr(String str) {
    MessageType? type;
    for (var t in types) {
      if (t.toString() == str) {
        type = t;
      }
    }
    return type ?? types.first;
  }
  @override
  String toString() {
    return 'text';
  }
}

class _TextMsg extends MessageType {
  const _TextMsg();
  @override
  String toString() => 'text';
}

class _FileMsg extends MessageType {
  const _FileMsg();
  @override
  String toString() => 'file';
}

class _VoiceMsg extends MessageType {
  const _VoiceMsg();
  @override
  String toString() => 'voice';
}

class _ImageMsg extends MessageType {
  const _ImageMsg();
  @override
  String toString() => 'image';
}

class MsgContent {
  final String? media;
  final double? imgH;
  final double? imgW;
  final String? mediaName;
  final String? text;
  final Duration? voice_duration;
  MsgContent({this.media, this.text, this.mediaName, this.imgH, this.imgW, this.voice_duration});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'media': media, 'text': text, "mediaName": mediaName, "imgW": imgW, "imgH": imgH, "voice_duration": voice_duration?.inMilliseconds};
  }

  factory MsgContent.fromMap(Map<String, dynamic> map) {
    return MsgContent(
      media: map['media'] != null ? map['media'] as String : null,
      text: map['text'] != null ? Di.emojiParser.emojify(map['text'] ?? '') : null,
      mediaName: map['mediaName'] != null ? map['mediaName'] as String : null,
      imgW: map['imgW'] != null ? double.parse(map['imgW'].toString()) : null,
      imgH: map['imgH'] != null ? double.parse(map['imgH'].toString()) : null,
      voice_duration: map["voice_duration"] != null ? Duration(milliseconds: int.tryParse(map["voice_duration"].toString()) ?? 0) : null,
    );
  }

  // TODO:check here @said
  factory MsgContent.fromJson(source) {
    if (source['media'] != null && source['text'] != null) {
      return MsgContent(media: source['media'], text: Di.emojiParser.emojify(source['text']), imgH: 0, imgW: 0);
    } else if (source['media'] == null && source['text'] != null) {
      return MsgContent(text: Di.emojiParser.emojify(source['text']), imgH: 0, imgW: 0);
    } else {
      return MsgContent.fromMap(source);
    }
  }

  @override
  bool operator ==(covariant MsgContent other) {
    if (identical(this, other)) return true;

    return other.media == media && other.imgH == imgH && other.imgW == imgW && other.mediaName == mediaName && other.text == text;
  }

  @override
  int get hashCode {
    return media.hashCode ^ imgH.hashCode ^ imgW.hashCode ^ mediaName.hashCode ^ text.hashCode;
  }

  MsgContent copyWith({String? media, double? imgH, double? imgW, String? mediaName, String? text, Duration? voice_duration}) {
    return MsgContent(
      media: media ?? this.media,
      imgH: imgH ?? this.imgH,
      imgW: imgW ?? this.imgW,
      mediaName: mediaName ?? this.mediaName,
      text: text ?? this.text,
      voice_duration: voice_duration ?? this.voice_duration,
    );
  }
}
