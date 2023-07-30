import 'branch_staff_model.dart';
import '../../../packages/modules/models/company/company_model.dart';

class VendorsModel {
  int? id;
  String? email;
  String? verifyCode;
  String? state;
  String? reason;
  String? remainder;
  String? owner;
  String? company_name;
  String? phone;
  CityId? city;
  bool? searchable;

  CompanyModel? company;

  VendorsModel({
    this.id,
    this.email,
    this.verifyCode,
    this.state,
    this.reason,
    this.remainder,
    this.company,
    this.owner,
    this.company_name,
    this.city,
    this.phone,
    this.searchable,
  });

  VendorsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    verifyCode = json['verify_code'];
    state = json['state'];
    reason = json['reason'];
    remainder = json['remainder'];
    company_name = json['company_name'];
    owner = json['owner'];
    phone = json['phone'];
    searchable = json['searchable'];
    company = json['company'] != null ? CompanyModel.fromJson(json['company']) : null;
    city = json['city'] != null ? CityId.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['verify_code'] = verifyCode;
    data['state'] = state;
    data['reason'] = reason;
    data['remainder'] = remainder;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
