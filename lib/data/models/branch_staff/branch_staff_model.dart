import '../../../packages/modules/models/company/company_model.dart';
import '../../../packages/modules/models/user_info/user_model.dart';
import 'vendors_model.dart';
import '../dashboard/pending_applications_model.dart';

import '../famous/famous_data.dart';

class BranchStaffModel {
  bool? success;
  String? status;
  String? message;
  BranchStaffData? satffData;

  BranchStaffModel({this.success, this.status, this.message, this.satffData});

  BranchStaffModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    satffData = json['data'] != null ? BranchStaffData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (satffData != null) {
      data['data'] = satffData!.toJson();
    }
    return data;
  }
}

class BranchStaffData {
  int? achievedContracts;
  int? totalAchievedContracts;

  // String? requiredContracts;
  EmployeeTypes? employeeTypes;
  CompanyBranchId? companyBranchId;
  List<CompanyOwner>? employees;
  List<VendorsModel>? vendors;
  List<VendorsModel>? agents;
  List<PendingApplicationsData>? internalEmployee;
  List<FamousEmployee>? famousEmployee;

  BranchStaffData({
    this.employeeTypes,
    this.companyBranchId,
    this.employees,
    this.vendors,
    this.achievedContracts,
    this.agents,
    this.totalAchievedContracts,
    this.internalEmployee,
    this.famousEmployee,
  });

  BranchStaffData.fromJson(Map<String, dynamic> json) {
    achievedContracts = json["achieved_contracts"];
    if (json['famous_employee'] != null) {
      famousEmployee = <FamousEmployee>[];
      json['famous_employee'].forEach((v) {
        famousEmployee!.add(FamousEmployee.fromJson(v));
      });
    }
    totalAchievedContracts = json["total_achieved_contracts"];
    employeeTypes = json['type'] != null ? EmployeeTypes.fromJson(json['type']) : null;
    companyBranchId = json['company_branch_id'] != null ? CompanyBranchId.fromJson(json['company_branch_id']) : null;
    if (json['employees'] != null) {
      employees = <CompanyOwner>[];
      json['employees'].forEach((v) {
        employees!.add(CompanyOwner.fromJson(v));
      });
    }
    if (json['vendors'] != null) {
      vendors = <VendorsModel>[];
      json['vendors'].forEach((v) {
        vendors!.add(VendorsModel.fromJson(v));
      });
    }
    if (json['internal_employee'] != null) {
      internalEmployee = <PendingApplicationsData>[];
      json['internal_employee'].forEach((v) {
        internalEmployee!.add(PendingApplicationsData.fromJson(v));
      });
    }

    if (json['agents'] != null) {
      agents = <VendorsModel>[];
      json['agents'].forEach((v) {
        agents!.add(VendorsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['achieved_contracts'] = achievedContracts;
    // data['required_contracts'] = requiredContracts;
    data['total_achieved_contracts'] = totalAchievedContracts;
    if (employeeTypes != null) {
      data['type'] = employeeTypes!.toJson();
    }
    if (companyBranchId != null) {
      data['company_branch_id'] = companyBranchId!.toJson();
    }
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    if (vendors != null) {
      data['vendors'] = vendors!.map((v) => v.toJson()).toList();
    }
    if (agents != null) {
      data['agents'] = agents!.map((v) => v.toJson()).toList();
    }
    if (internalEmployee != null) {
      data['internal_employee'] = internalEmployee!.map((v) => v.toJson()).toList();
    }

    if (famousEmployee != null) {
      data['famous_employee'] = famousEmployee!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeTypes {
  String? key;
  String? value;

  EmployeeTypes({this.key, this.value});

  EmployeeTypes.fromJson(Map<String, dynamic> json) {
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

class CompanyBranchId {
  int? id;
  AddressId? addressId;

  CompanyBranchId({this.id, this.addressId});

  CompanyBranchId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressId = json['address'] != null ? AddressId.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    return data;
  }
}

class AddressId {
  int? id;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  CityId? cityId;

  AddressId({
    this.id,
    this.latitude,
    this.longitude,
    this.state,
    this.street,
    this.building,
    this.intercom,
    this.floor,
    this.zipcode,
    this.detailedAddress,
    this.cityId,
  });

  AddressId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    // state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    cityId = json['city_id'] != null ? CityId.fromJson(json['city_id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    if (cityId != null) {
      data['city_id'] = cityId!.toJson();
    }
    return data;
  }
}

class CityId {
  int? id;
  String? symbols;
  EmployeeTypes? name;
  CountryId? countryId;
  bool? isVisible;

  CityId({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  CityId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? EmployeeTypes.fromJson(json['name']) : null;
    countryId = json['country_id'] != null ? CountryId.fromJson(json['country_id']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (countryId != null) {
      data['country_id'] = countryId!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class CountryId {
  int? id;
  String? symbols;
  EmployeeTypes? name;

  bool? isVisible;

  CountryId({this.id, this.symbols, this.name, this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? EmployeeTypes.fromJson(json['name']) : null;

    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class Type {
  int? id;
  String? role;
  EmployeeTypes? name;
  ActionCollection? actionCollection;

  Type({this.id, this.role, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? EmployeeTypes.fromJson(json['name']) : null;
    actionCollection = json['action_collection'] != null ? ActionCollection.fromJson(json['action_collection']) : null;
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

class Image {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Image({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  Image.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    return data;
  }
}
