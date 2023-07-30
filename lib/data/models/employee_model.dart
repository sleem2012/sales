class EmployeeModel {
  bool? success;
  String? message;
  EmployeeData? employeeData;
  int? code;

  EmployeeModel({this.success, this.message, this.employeeData, this.code});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    employeeData = json['data'] != null ? EmployeeData.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (employeeData != null) {
      data['data'] = employeeData!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class EmployeeData {
  String? title;
  Total? total;
  List<Childes>? childes;

  EmployeeData({this.title, this.total, this.childes});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    total = json['total'] != null ? Total.fromJson(json['total']) : null;
    if (json['childes'] != null) {
      childes = <Childes>[];
      json['childes'].forEach((Map<String, dynamic> v) {
        childes!.add(Childes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (total != null) {
      data['total'] = total!.toJson();
    }
    if (childes != null) {
      data['childes'] = childes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Total {
  Target? target;
  Target? achievement;

  Total({this.target, this.achievement});

  Total.fromJson(Map<String, dynamic> json) {
    target = json['target'] != null ? Target.fromJson(json['target']) : null;
    achievement = json['achievement'] != null ? Target.fromJson(json['achievement']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (target != null) {
      data['target'] = target!.toJson();
    }
    if (achievement != null) {
      data['achievement'] = achievement!.toJson();
    }
    return data;
  }
}

class Target {
  int? contract;
  int? cost;

  Target({this.contract, this.cost});

  Target.fromJson(Map<String, dynamic> json) {
    contract = json['contract'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contract'] = contract;
    data['cost'] = cost;
    return data;
  }
}

class Childes {
  int? id;
  Child? child;

  Childes({this.id, this.child});

  Childes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    child = json['child'] != null ? Child.fromJson(json['child']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (child != null) {
      data['child'] = child!.toJson();
    }
    return data;
  }
}

class Child {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? gender;
  String? birthdate;
  String? joined;
  UserType? userType;
  UserLang? userLang;
  UserCurrency? userCurrency;
  UserAddress? userAddress;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;
  List<String>? image;
  Target? target;
  Target? achievement;

  Child(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.gender,
      this.birthdate,
      this.joined,
      this.userType,
      this.userLang,
      this.userCurrency,
      this.userAddress,
      this.isOnline,
      this.isBlocked,
      this.blockReason,
      this.image,
      this.target,
      this.achievement,});

  Child.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    joined = json['joined'];
    userType = json['user_type'] != null ? UserType.fromJson(json['user_type']) : null;
    userLang = json['user_lang'] != null ? UserLang.fromJson(json['user_lang']) : null;
    userCurrency = json['user_currency'] != null ? UserCurrency.fromJson(json['user_currency']) : null;
    userAddress = json['user_address'] != null ? UserAddress.fromJson(json['user_address']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
    image = json['image'].cast<String>();
    target = json['target'] != null ? Target.fromJson(json['target']) : null;
    achievement = json['achievement'] != null ? Target.fromJson(json['achievement']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['joined'] = joined;
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
    data['image'] = image;
    if (target != null) {
      data['target'] = target!.toJson();
    }
    if (achievement != null) {
      data['achievement'] = achievement!.toJson();
    }
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
