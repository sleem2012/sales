class BanksModel {
  bool? success;
  String? status;
  String? message;
  List<BankModelData>? data;

  BanksModel({this.success, this.status, this.message, this.data});

  BanksModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BankModelData>[];
      json['data'].forEach((v) {
        data!.add(BankModelData.fromJson(v));
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

class BankModelData {
  int? id;
  String? code;
  Name? name;
  String? icon;
  int? isVisible;

  BankModelData({this.id, this.code, this.name, this.icon, this.isVisible});

  BankModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    icon = json['icon'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['icon'] = icon;
    data['is_visible'] = isVisible;
    return data;
  }
}

class Name {
  String? key;
  String? value;

  Name({this.key, this.value});

  Name.fromJson(Map<String, dynamic> json) {
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
