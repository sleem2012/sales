import 'package:flutter/foundation.dart';
import 'send_msg_model.dart';

class ChatMsgsModel {
  bool? success;
  String? status;
  String? message;
  List<SendMsgModel>? data;
  Pagination? pagination;

  ChatMsgsModel({
    this.success,
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  ChatMsgsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SendMsgModel>[];
      json['data'].forEach((v) {
        data!.add(SendMsgModel.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }

  ChatMsgsModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<SendMsgModel>? data,
    Pagination? pagination,
  }) {
    return ChatMsgsModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  factory ChatMsgsModel.fromMap(Map<String, dynamic> map) {
    return ChatMsgsModel(
      success: map['success'] != null ? map['success'] as bool : null,
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<SendMsgModel>.from(
              (map['data'] as List<int>).map<SendMsgModel?>(
                (x) => SendMsgModel.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'ChatMsgsModel(success: $success, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(covariant ChatMsgsModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.status == status &&
        other.message == message &&
        listEquals(other.data, data) &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode ^ pagination.hashCode;
  }
}

abstract class ChatRoomType {
  const ChatRoomType();
  static const ChatRoomType product = _Product();
  static const ChatRoomType company = _Company();
  static const ChatRoomType job = _Job();
  static const ChatRoomType user = _User();
  static const ChatRoomType order = _Order();
  static const ChatRoomType billOrder = _BillOrder();
  static const ChatRoomType bookTrip = _BookTrip();
  static const ChatRoomType requestQuote = _RequestQuote();
}

class _RequestQuote extends ChatRoomType {
 const _RequestQuote();
  @override
  String toString() {
    return 'request_quote';
  }
}

class _User extends ChatRoomType {
  const _User();
  @override
  String toString() {
    return 'user';
  }
}

class _Product extends ChatRoomType {
  const _Product();
  @override
  String toString() {
    return 'product';
  }
}

class _Company extends ChatRoomType {
  const _Company();
  @override
  String toString() {
    return 'company';
  }
}

class _Job extends ChatRoomType {
  const _Job();
  @override
  String toString() {
    return 'job';
  }
}

class _BookTrip extends ChatRoomType {
  const _BookTrip();
  @override
  String toString() {
    return 'book_trip';
  }
}

class _Order extends ChatRoomType {
  const _Order();
  @override
  String toString() {
    return 'order';
  }
}

class Pagination {
  Meta? meta;
  Pagination({this.meta});
  Pagination.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class _BillOrder extends ChatRoomType {
  const _BillOrder();
  @override
  String toString() {
    return 'order_bills';
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? to;
  int? total;
  Meta({this.currentPage, this.from, this.to, this.total});
  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    total = json['total'];
  }
}
