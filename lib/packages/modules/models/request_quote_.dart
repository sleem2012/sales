// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'company/address_model.dart';
import 'company/company_model.dart';
import 'user_info/user_model.dart';

class RequestQuoteResponse {
  bool? success;
  String? status;
  String? message;
  List<RequestQuoteModel>? data;

  RequestQuoteResponse({this.success, this.status, this.message, this.data});

  RequestQuoteResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RequestQuoteModel>[];
      json['data'].forEach((v) {
        data!.add(RequestQuoteModel.fromJson(v));
      });
    }
  }

  RequestQuoteResponse copyWith({
    bool? success,
    String? status,
    String? message,
    List<RequestQuoteModel>? data,
  }) {
    return RequestQuoteResponse(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class RequestQuoteModel {
  CompanyBranch? companyBranchId;
  UserModelData? userId;
  String? tags;
  String? paragraph;
  String? state;
  int? id;
  int? vendor_chat_id;
  String? created_at;

  RequestQuoteModel({this.companyBranchId, this.userId, this.tags, this.paragraph, this.state, this.id, this.vendor_chat_id, this.created_at});

  RequestQuoteModel.fromJson(Map<String, dynamic> json) {
    companyBranchId = json['company_branch_id'] != null ? CompanyBranch.fromJson(json['company_branch_id']) : null;
    userId = json['user_id'] != null ? UserModelData.fromJson(json['user_id']) : null;
    tags = json['tags'];
    paragraph = json['paragraph'];
    state = json['state'];
    id = json['id'];
    vendor_chat_id = json['vendor_chat_id'];
    created_at = json['created_at'];
  }

  RequestQuoteModel copyWith({
    CompanyBranch? companyBranchId,
    UserModelData? userId,
    String? tags,
    String? paragraph,
    String? state,
    int? id,
    int? vendor_chat_id,
    String? created_at,
  }) {
    return RequestQuoteModel(
      companyBranchId: companyBranchId ?? this.companyBranchId,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      paragraph: paragraph ?? this.paragraph,
      state: state ?? this.state,
      id: id ?? this.id,
      vendor_chat_id: vendor_chat_id ?? this.vendor_chat_id,
      created_at: created_at ?? this.created_at,
    );
  }
}

class CompanyBranch {
  CompanyModel? company;
  int? id;
  AddressModel? address;
  CompanyBranch({
    this.company,
    this.id,
    this.address,
  });

  factory CompanyBranch.fromJson(Map<String, dynamic> map) {
    return CompanyBranch(
      company: map['company'] != null ? CompanyModel.fromJson(map['company'] as Map<String, dynamic>) : null,
      id: map['id'],
      address: map['address'] != null ? AddressModel.fromJson(map['address'] as Map<String, dynamic>) : null,
    );
  }

  CompanyBranch copyWith({
    CompanyModel? company,
    int? id,
    AddressModel? address,
  }) {
    return CompanyBranch(
      company: company ?? this.company,
      id: id ?? this.id,
      address: address ?? this.address,
    );
  }
}
