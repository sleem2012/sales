import '../../../chat/data/models/chat_model.dart';
import 'company_model.dart';

class CompanyResponse {
  bool? success;
  String? status;
  String? message;
  List<CompanyModel>? data;
  Pagination? pagination;

  CompanyResponse({
    this.success,
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  CompanyResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CompanyModel>[];
      json['data'].forEach((v) {
        data!.add(CompanyModel.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
}
