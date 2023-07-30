// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class BranchModel {
  bool? success;
  String? status;
  String? message;
  List<BranchData>? branchData;

  BranchModel({this.success, this.status, this.message, this.branchData});

  BranchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      branchData = <BranchData>[];
      json['data'].forEach((v) {
        branchData!.add(BranchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (branchData != null) {
      data['data'] = branchData!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(covariant BranchModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.branchData, branchData);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ branchData.hashCode;
  }

  BranchModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<BranchData>? branchData,
  }) {
    return BranchModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      branchData: branchData ?? this.branchData,
    );
  }
}

class BranchData {
  int? id;
  AddressId? addressId;

  BranchData({this.id, this.addressId});

  BranchData.fromJson(Map<String, dynamic> json) {
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

  @override
  bool operator ==(covariant BranchData other) {
    if (identical(this, other)) return true;

    return other.id == id && other.addressId == addressId;
  }

  @override
  int get hashCode => id.hashCode ^ addressId.hashCode;

  BranchData copyWith({
    int? id,
    AddressId? addressId,
  }) {
    return BranchData(
      id: id ?? this.id,
      addressId: addressId ?? this.addressId,
    );
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

  AddressId({this.id, this.latitude, this.longitude, this.state, this.street, this.building, this.intercom, this.floor, this.zipcode, this.detailedAddress, this.cityId});

  AddressId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (state != null) state = json['state'];
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

  @override
  bool operator ==(covariant AddressId other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.state == state &&
        other.street == street &&
        other.building == building &&
        other.intercom == intercom &&
        other.floor == floor &&
        other.zipcode == zipcode &&
        other.detailedAddress == detailedAddress &&
        other.cityId == cityId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        state.hashCode ^
        street.hashCode ^
        building.hashCode ^
        intercom.hashCode ^
        floor.hashCode ^
        zipcode.hashCode ^
        detailedAddress.hashCode ^
        cityId.hashCode;
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

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}

class CityId {
  int? id;
  String? symbols;
  Name? name;
  CountryId? countryId;
  bool? isVisible;

  CityId({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  CityId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
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

  @override
  bool operator ==(covariant CityId other) {
    if (identical(this, other)) return true;

    return other.id == id && other.symbols == symbols && other.name == name && other.countryId == countryId && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ symbols.hashCode ^ name.hashCode ^ countryId.hashCode ^ isVisible.hashCode;
  }
}

class CountryId {
  int? id;
  String? symbols;
  Name? name;
  DefaultLanguage? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  CountryId({this.id, this.symbols, this.name, this.defaultLanguage, this.flag, this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    defaultLanguage = json['default_language'] != null ? DefaultLanguage.fromJson(json['default_language']) : null;
    flag = json['flag'] != null ? Flag.fromJson(json['flag']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (defaultLanguage != null) {
      data['default_language'] = defaultLanguage!.toJson();
    }
    if (flag != null) {
      data['flag'] = flag!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant CountryId other) {
    if (identical(this, other)) return true;

    return other.id == id && other.symbols == symbols && other.name == name && other.defaultLanguage == defaultLanguage && other.flag == flag && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ symbols.hashCode ^ name.hashCode ^ defaultLanguage.hashCode ^ flag.hashCode ^ isVisible.hashCode;
  }
}

class DefaultLanguage {
  int? id;
  String? symbols;
  Name? nameValues;

  DefaultLanguage({this.id, this.symbols, this.nameValues});

  DefaultLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    nameValues = json['name_values'] != null ? Name.fromJson(json['name_values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (nameValues != null) {
      data['name_values'] = nameValues!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(covariant DefaultLanguage other) {
    if (identical(this, other)) return true;

    return other.id == id && other.symbols == symbols && other.nameValues == nameValues;
  }

  @override
  int get hashCode => id.hashCode ^ symbols.hashCode ^ nameValues.hashCode;
}

class Flag {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;

  Flag({this.s16px, this.s32px, this.s64px, this.s128px});

  Flag.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    return data;
  }

  @override
  bool operator ==(covariant Flag other) {
    if (identical(this, other)) return true;

    return other.s16px == s16px && other.s32px == s32px && other.s64px == s64px && other.s128px == s128px;
  }

  @override
  int get hashCode {
    return s16px.hashCode ^ s32px.hashCode ^ s64px.hashCode ^ s128px.hashCode;
  }
}
