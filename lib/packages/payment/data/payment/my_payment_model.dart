// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyPaymentsModel {
  bool? success;
  String? status;
  String? message;
  List<PaymentData>? data;

  MyPaymentsModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  MyPaymentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PaymentData>[];
      json['data'].forEach((v) {
        data!.add(PaymentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  MyPaymentsModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<PaymentData>? data,
  }) {
    return MyPaymentsModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class PaymentData {
  int? id;
  bool? isSelected;
  bool? isVisible;
  List<PayFieldValues>? values;
  String? state;
  String? url;
  int? type_id;

  PaymentData({
    this.id,
    this.isSelected,
    this.isVisible,
    this.values,
    this.state,
    this.url,
  });

  PaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSelected = json['is_selected'];
    isVisible = json['is_visible'];
    if (json['values'] != null) {
      values = <PayFieldValues>[];
      json['values'].forEach((v) {
        values!.add(PayFieldValues.fromJson(v));
      });
    }
    state = json['state'];
    url = json['url'];
    type_id = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_selected'] = isSelected;
    data['is_visible'] = isVisible;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    data['state'] = state;
    data['url'] = url;
    data['type_id'] = type_id;
    return data;
  }
}

class PayFieldValues {
  String? key;
  PayFieldHint? hint;
  String? value;
  int? id;

  PayFieldValues({this.key, this.hint, this.value, this.id});

  PayFieldValues.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    hint = json['hint'] != null ? PayFieldHint.fromJson(json['hint']) : null;
    value = json['value'];
    id = json['id'] ?? -1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    if (hint != null) {
      data['hint'] = hint!.toJson();
    }
    data['value'] = value;
    return data;
  }
}

class PayFieldHint {
  String? key;
  String? value;

  PayFieldHint({this.key, this.value});

  PayFieldHint.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
