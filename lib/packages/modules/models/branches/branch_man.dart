import 'package:flutter/foundation.dart';

import '../request_quote_.dart';
import '../system_user.dart';
import 'branch_model.dart';

class BranchManModel {
  bool? success;
  String? status;
  String? message;
  BranchManData? data;

  BranchManModel({this.success, this.status, this.message, this.data});

  BranchManModel.fromJson(Map<String, dynamic> json) {
    debugPrint('================= $json : ');
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = BranchManData.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.toJson();
    return data;
  }
}

class BranchManData {
  String? earning;
  List<BranchManager>? employees;

  BranchManData({this.earning, this.employees});

  BranchManData.fromJson(Map<String, dynamic> json) {
    earning = json['earning'];
    if (json['employees'] != null) {
      employees = <BranchManager>[];
      json['employees'].forEach((v) {
        employees!.add(BranchManager.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['earning'] = earning;
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BranchManager {
  int? id;
  String? name;
  String? email;
  String? phone;
  Image? image;
  Type? type;
  bool? isBlocked;
  bool? isOnline;
  String? blockReason;
  String? joinedAt;
  CompanyBranch? branch;
  BranchManager({this.id, this.name, this.email, this.image, this.type, this.isBlocked, this.blockReason, this.joinedAt, this.phone, this.isOnline, this.branch});

  BranchManager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    isBlocked = json['is_blocked'] == true;
    isOnline = json['is_online'] == true;
    blockReason = json['block_reason'];
    joinedAt = json['joined_at'];
    branch = json['company_branch'] != null ? CompanyBranch.fromJson(json['company_branch']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['is_blocked'] = isBlocked;
    data['is_online'] = isOnline;
    data['block_reason'] = blockReason;
    data['joined_at'] = joinedAt;
    return data;
  }
}

class Type {
  int? id;
  String? role;
  Name? name;

  Type({this.id, this.role, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}
