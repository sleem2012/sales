class PaymentTypesModel {
  bool? success;
  String? status;
  String? message;
  List<PaymentTypeData>? data;

  PaymentTypesModel({this.success, this.status, this.message, this.data});

  PaymentTypesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PaymentTypeData>[];
      json['data'].forEach((v) {
        data!.add(PaymentTypeData.fromJson(v));
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
}

class PaymentTypeData {
  int? id;
  String? type;
  PaymentTypeName? name;
  List<PaymentTypeKeys>? keys;
  bool? isVisible;

  PaymentTypeData({this.id, this.type, this.name, this.keys, this.isVisible});

  PaymentTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'] != null ? PaymentTypeName.fromJson(json['name']) : null;
    if (json['keys'] != null) {
      keys = <PaymentTypeKeys>[];
      json['keys'].forEach((v) {
        keys!.add(PaymentTypeKeys.fromJson(v));
      });
    }
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (keys != null) {
      data['keys'] = keys!.map((v) => v.toJson()).toList();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class PaymentTypeName {
  String? key;
  String? value;

  PaymentTypeName({this.key, this.value});

  PaymentTypeName.fromJson(Map<String, dynamic> json) {
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

class PaymentTypeKeys {
  String? key;
  PaymentTypeName? placeholder;

  PaymentTypeKeys({this.key, this.placeholder});

  PaymentTypeKeys.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    placeholder = json['placeholder'] != null ? PaymentTypeName.fromJson(json['placeholder']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    if (placeholder != null) {
      data['placeholder'] = placeholder!.toJson();
    }
    return data;
  }
}
