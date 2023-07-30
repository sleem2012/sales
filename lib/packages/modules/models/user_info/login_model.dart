import 'package:flutter/foundation.dart';

class LoginModel {
  bool? success;
  String? message;
  UserData? userData;
  int? code;

  LoginModel({this.success, this.message, this.userData, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? gender;
  String? birthdate;
  DateTime? birthDateToDateTime;
  UserType? userType;
  UserLang? userLang;
  UserCurrency? userCurrency;
  UserAddress? userAddress;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;
  String? token;
  List<String>? image;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.gender,
      this.birthdate,
      this.userType,
      this.userLang,
      this.userCurrency,
      this.userAddress,
      this.isOnline,
      this.isBlocked,
      this.blockReason,
      this.token,
      this.image,});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    userType =
        json['user_type'] != null ? UserType.fromJson(json['user_type']) : null;
    userLang =
        json['user_lang'] != null ? UserLang.fromJson(json['user_lang']) : null;
    userCurrency = json['user_currency'] != null
        ? UserCurrency.fromJson(json['user_currency'])
        : null;
    userAddress = json['user_address'] != null
        ? UserAddress.fromJson(json['user_address'])
        : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
    token = json['token'];
    image = json['image'].cast<String>();
    birthDateToDateTime = DateTime(
      int.tryParse(birthdate?.split('/').last ?? '2022') ?? 2022,
      int.tryParse(birthdate?.split('/')[1] ?? '1') ?? 1,
      int.tryParse(birthdate?.split('/').first ?? '1') ?? 1,
    );
    debugPrint(
        '**************************** ${birthDateToDateTime.toString()} : ',);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    if (userType != null) {
      data['user_type'] = userType!.toJson();
    }
    if (userLang != null) {
      data['user_lang'] = userLang!.toJson();
    }
    if (userCurrency != null) {
      data['user_currency'] = userCurrency!.toJson();
    }
    if (userAddress != null) {
      data['user_address'] = userAddress!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    data['token'] = token;
    data['image'] = image;

    return data;
  }
}

class UserType {
  int? id;
  String? name;

  UserType({this.id, this.name});

  UserType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class UserLang {
  int? id;
  String? name;
  String? symbols;

  UserLang({this.id, this.name, this.symbols});

  UserLang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbols = json['symbols'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbols'] = symbols;
    return data;
  }
}

class UserCurrency {
  Name? name;
  String? symbols;
  String? dollarRate;

  UserCurrency({this.name, this.symbols, this.dollarRate});

  UserCurrency.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    symbols = json['symbols'];
    dollarRate = json['dollar_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['symbols'] = symbols;
    data['dollar_rate'] = dollarRate;
    return data;
  }
}

class Name {
  String? ar;
  String? en;

  Name({this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

class UserAddress {
  String? detailedAddress;
  String? building;

  UserAddress({this.detailedAddress, this.building});

  UserAddress.fromJson(Map<String, dynamic> json) {
    detailedAddress = json['detailed_address'];
    building = json['building'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detailed_address'] = detailedAddress;
    data['building'] = building;
    return data;
  }
}
