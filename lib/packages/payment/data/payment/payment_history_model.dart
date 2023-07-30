// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentHistoryModel {
  bool? success;
  String? status;
  String? message;
  List<HistoryData>? historyData;
  Pagination? pagination;

  PaymentHistoryModel({
    this.success,
    this.status,
    this.message,
    this.historyData,
    this.pagination,
  });

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      historyData = <HistoryData>[];
      json['data'].forEach((v) {
        historyData!.add(HistoryData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }

  PaymentHistoryModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<HistoryData>? historyData,
    Pagination? pagination,
  }) {
    return PaymentHistoryModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      historyData: historyData ?? this.historyData,
      pagination: pagination ?? this.pagination,
    );
  }
}

class HistoryData {
  int? id;
  String? transactionId;
  String? state;
  String? type;
  String? amount;
  String? currency;
  String? details;
  String? card;
  String? createdAt;

  HistoryData({
    this.id,
    this.transactionId,
    this.state,
    this.type,
    this.amount,
    this.currency,
    this.details,
    this.card,
    this.createdAt,
  });

  HistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['Transaction_id'];
    state = json['state'];
    type = json['type'];
    amount = json['amount'];
    currency = json['currency'];
    details = json['details'];
    card = json['card_number'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Transaction_id'] = transactionId;
    data['state'] = state;
    data['type'] = type;
    data['amount'] = amount;
    data['currency'] = currency;
    data['details'] = details;
    data['card_number'] = card;
    //lat
    // long
    // card_number
    // card_name
    data['created_at'] = createdAt;
    return data;
  }

  HistoryData copyWith({
    int? id,
    String? transactionId,
    String? state,
    String? type,
    String? amount,
    String? currency,
    String? details,
    String? card,
    String? createdAt,
  }) {
    return HistoryData(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      state: state ?? this.state,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      details: details ?? this.details,
      card: card ?? this.card,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class Pagination {
  Meta? meta;

  Pagination({this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? to;
  int? pages;
  String? perPage;
  int? total;

  Meta({this.currentPage, this.from, this.to, this.pages, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    pages = json['pages'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'currentPage': currentPage,
      'from': from,
      'to': to,
      'pages': pages,
      'perPage': perPage,
      'total': total,
    };
  }
}
