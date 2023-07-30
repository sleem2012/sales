class CompanyPackageModel {
  bool? success;
  String? status;
  String? message;
  List<CompanyData>? data;

  CompanyPackageModel({this.success, this.status, this.message, this.data});

  CompanyPackageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CompanyData>[];
      json['data'].forEach((v) {
        data!.add(CompanyData.fromJson(v));
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

class CompanyData {
  int? id;
  String? code;
  String? price;

  CompanyName? name;
  CompanyName? description;
  CompanyType? companyType;
  CompanyCurrency? currency;

  CompanyData({
    this.id,
    this.code,
    this.price,
    this.name,
    this.description,
    this.companyType,
    this.currency,
  });

  CompanyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    price = json['price'];

    name = json['name'] != null ? CompanyName.fromJson(json['name']) : null;
    description = json['description'] != null ? CompanyName.fromJson(json['description']) : null;
    companyType = json['company_type'] != null ? CompanyType.fromJson(json['company_type']) : null;
    currency = json['currency'] != null ? CompanyCurrency.fromJson(json['currency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['price'] = price;

    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (companyType != null) {
      data['company_type'] = companyType!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

class CompanyName {
  String? key;
  String? value;

  CompanyName({this.key, this.value});

  CompanyName.fromJson(Map<String, dynamic> json) {
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

class CompanyCurrency {
  int? id;
  double? dollar;
  String? symbols;
  CompanyName? name;
  bool? isVisible;

  CompanyCurrency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  CompanyCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dollar = double.tryParse(json['dollar'].toString());
    symbols = json['symbols'];
    name = json['name'] != null ? CompanyName.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dollar'] = dollar;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class CompanyTypeModel {
  bool? success;
  String? status;
  String? message;
  List<CompanyType>? data;

  CompanyTypeModel({this.success, this.status, this.message, this.data});

  CompanyTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CompanyType>[];
      json['data'].forEach((v) {
        data!.add(CompanyType.fromJson(v));
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

class CompanyType {
  int? id;
  String? key;
  Name? name;
  Iconss? icons;

  CompanyType({this.id, this.key, this.name, this.icons});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    icons = json['icons'] != null ? Iconss.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (icons != null) {
      data['icons'] = icons!.toJson();
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

class Iconss {
  String? svg;

  Iconss({this.svg});

  Iconss.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }
}
