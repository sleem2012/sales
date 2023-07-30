import '../../../packages/modules/models/user_info/user_model.dart';
import '../dashboard/pending_applications_model.dart';

class FamousModel {
  bool? success;
  String? status;
  String? message;
  List<FamousEmployee>? data;
  Pagination? pagination;

  FamousModel(
      {this.success, this.status, this.message, this.data, this.pagination,});

  FamousModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FamousEmployee>[];
      json['data'].forEach((v) {
        data!.add(FamousEmployee.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class FamousEmployee {
  int? id;
  String? email;
  String? coupon;
  Type? type;
  UserModelData? user;
  UserModelData? assigner;
  CommercialAttributes? commercial;
  String? state;
  String? joinedAt;

  FamousEmployee(
      {this.id,
      this.email,
      this.coupon,
      this.type,
      this.user,
      this.assigner,
      this.commercial,
      this.state,
      this.joinedAt,});

  FamousEmployee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    coupon = json['coupon'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    assigner = json['assigner'] != null
        ? UserModelData.fromJson(json['assigner'])
        : null;
    user = json['user'] != null ? UserModelData.fromJson(json['user']) : null;
    commercial = json['commercial'] != null
        ? CommercialAttributes.fromJson(json['commercial'])
        : null;
    state = json['state'];
    joinedAt = json['joined_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['coupon'] = coupon;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (assigner != null) {
      data['assigner'] = assigner!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (commercial != null) {
      data['commercial'] = commercial!.toJson();
    }
    data['state'] = state;
    data['joined_at'] = joinedAt;
    return data;
  }
}

class Type {
  int? id;
  String? role;
  String? commission;
  String? vendorDiscount;
  Name? name;

  Type({this.id, this.role, this.commission, this.vendorDiscount, this.name});

  Type.fromJson(Map<String, dynamic> json) {
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

class Pagination {
  Links? links;
  Meta? meta;

  Pagination({this.links, this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Links {
  String? first;
  String? prev;
  String? next;

  Links({this.first, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? to;
  int? perPage;
  int? total;

  Meta({this.currentPage, this.from, this.to, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['to'] = to;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}
