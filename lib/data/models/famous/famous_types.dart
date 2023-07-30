class FamousTypes {
  bool? success;
  String? status;
  String? message;
  List<FamousTypesData>? data;

  FamousTypes({this.success, this.status, this.message, this.data});

  FamousTypes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FamousTypesData>[];
      json['data'].forEach((v) {
        data!.add(FamousTypesData.fromJson(v));
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

class FamousTypesData {
  int? id;
  String? role;
  String? commission;
  String? vendorDiscount;
  Name? name;

  FamousTypesData({this.id, this.role, this.commission, this.vendorDiscount, this.name});

  FamousTypesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    commission = json['commission'];
    vendorDiscount = json['vendor_discount'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['commission'] = commission;
    data['vendor_discount'] = vendorDiscount;
    if (name != null) {
      data['name'] = name!.toJson();
    }
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
