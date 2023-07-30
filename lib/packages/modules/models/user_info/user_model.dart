import '../category/category_model.dart';
import '../company/company_model.dart';
import '../language/languages_model.dart';
import 'catecory_model.dart';

class UserModel {
  bool? success;
  String? status;
  String? message;
  UserModelData? data;

  UserModel({this.success, this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  UserModel copyWith({
    bool? success,
    String? status,
    String? message,
    UserModelData? data,
  }) {
    return UserModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class UserModelData {
  int? id;
  String? name;
  Contract? contract;
  String? earning;
  String? email;
  List<Category>? categories;
  String? nationality_id;
  String? mobile;
  UserImage? image;
  bool? forallUser;
  String? gender;
  String? birthdate;
  UserRole? type;
  LangDatum? language;
  UserCurrency? currency;
  UserAddress? address;
  CompanyModel? userCompany;
  UserCompanyBranchModel? companyBranch;
  String? token;
  bool? is_email_verified;
  String? tokenExpired;
  String? category;
  String? alternative_id;

  UserModelData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.category,
    this.gender,
    this.contract,
    this.earning,
    this.nationality_id,
    this.birthdate,
    this.type,
    this.language,
    this.currency,
    this.address,
    this.userCompany,
    this.companyBranch,
    this.token,
    this.tokenExpired,
  });

  UserModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? 'name';
    email = json['email'];
    mobile = json['mobile'];
    forallUser = json['forall_user'];
    alternative_id = json['alternative_id'];

    earning = json['earning'];
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
    alternative_id = json['alternative_id'];
    category = categories?.fold('', (previousValue, element) => '${previousValue!.isEmpty ? '' : '$previousValue , '} ${element.name}');
    nationality_id = json['nationality'].toString();
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
    gender = json['gender'];
    is_email_verified = json['is_email_verified'];
    birthdate = json['birthdate'];
    type = json['type'] != null ? UserRole.fromJson(json['type']) : null;
    language = json['language'] != null ? LangDatum.fromJson(json['language']) : null;
    currency = json['currency'] != null ? UserCurrency.fromJson(json['currency']) : null;
    address = json['address'] != null ? UserAddress.fromJson(json['address']) : null;
    userCompany = json['company'] != null ? CompanyModel.fromJson(json['company']) : null;
    companyBranch = json['company_branch'] != null ? UserCompanyBranchModel.fromJson(json['company_branch']) : null;
    token = json['token'];
    tokenExpired = json['token_expired'];
    contract = json['contract'] != null ? Contract.fromJson(json['contract']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['nationality'] = nationality_id;
    data['forall_user'] = forallUser;

    if (contract != null) {
      data['contract'] = contract!.toJson();
    }
    data['earning'] = earning;

    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (language != null) {
      data['language'] = language!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (userCompany != null) {
      data['company'] = userCompany!.toJson();
    }
    if (companyBranch != null) {
      data['company_branch'] = companyBranch!.toJson();
    }
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  UserModelData copyWith({
    int? id,
    String? name,
    Category? category,
    String? email,
    String? nationality_id,
    String? earning,
    String? mobile,
    UserImage? image,
    String? gender,
    String? birthdate,
    UserRole? type,
    LangDatum? language,
    UserCurrency? currency,
    UserAddress? address,
    CompanyModel? userCompany,
    UserCompanyBranchModel? companyBranch,
    String? token,
    String? tokenExpired,
  }) {
    return UserModelData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      earning: earning ?? this.earning,
      nationality_id: nationality_id ?? this.nationality_id,
      mobile: mobile ?? this.mobile,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      type: type ?? this.type,
      language: language ?? this.language,
      currency: currency ?? this.currency,
      address: address ?? this.address,
      userCompany: userCompany ?? this.userCompany,
      companyBranch: companyBranch ?? this.companyBranch,
      token: token ?? this.token,
      tokenExpired: tokenExpired ?? this.tokenExpired,
    );
  }
}

class UserImage {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  UserImage({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  UserImage.fromJson(Map<String, dynamic> json) {
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

class UserRole {
  int? id;
  String? role;
  Name? name;
  ActionCollection? actionCollection;
  SearchCollection? searchCollection;

  UserRole({
    this.id,
    this.actionCollection,
    this.role,
    this.name,
    this.searchCollection,
  });

  UserRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    actionCollection = json['action_collection'] != null ? ActionCollection.fromJson(json['action_collection']) : null;
    searchCollection = json['search_collection'] != null ? SearchCollection.fromJson(json['search_collection']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    if (actionCollection != null) {
      data['action_collection'] = actionCollection!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (searchCollection != null) {
      data['search_collection'] = searchCollection!.toJson();
    }
    return data;
  }
}

class SearchCollection {
  UsersSearch? users;
  VendorSearch? vendor;
  VendorSearch? agencies;

  SearchCollection({this.users, this.vendor, this.agencies});

  SearchCollection.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? UsersSearch.fromJson(json['users']) : null;
    vendor = json['vendor'] != null ? VendorSearch.fromJson(json['vendor']) : null;
    agencies = json['agencies'] != null ? VendorSearch.fromJson(json['agencies']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.toJson();
    }
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    if (agencies != null) {
      data['agencies'] = agencies!.toJson();
    }
    return data;
  }
}

class UsersSearch {
  ViewUser? view;
  bool? search;

  UsersSearch({this.view, this.search});

  UsersSearch.fromJson(Map<String, dynamic> json) {
    view = json['view'] != null ? ViewUser.fromJson(json['view']) : null;
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (view != null) {
      data['view'] = view!.toJson();
    }
    data['search'] = search;
    return data;
  }
}

class VendorSearch {
  ViewVendor? view;
  bool? search;

  VendorSearch({this.view, this.search});

  VendorSearch.fromJson(Map<String, dynamic> json) {
    view = json['view'] != null ? ViewVendor.fromJson(json['view']) : null;
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (view != null) {
      data['view'] = view!.toJson();
    }
    data['search'] = search;
    return data;
  }
}

class ViewUser {
  bool? chat;
  bool? block;
  bool? delete;
  bool? mobile;

  ViewUser({this.chat, this.block, this.delete, this.mobile});

  ViewUser.fromJson(Map<String, dynamic> json) {
    chat = json['chat'];
    block = json['block'];
    delete = json['delete'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat'] = chat;
    data['block'] = block;
    data['delete'] = delete;
    data['mobile'] = mobile;
    return data;
  }
}

class ViewVendor {
  bool? lock;
  bool? owner;
  bool? agents;
  bool? delete;
  bool? company;

  ViewVendor({this.lock, this.owner, this.agents, this.delete, this.company});

  ViewVendor.fromJson(Map<String, dynamic> json) {
    lock = json['lock'];
    owner = json['owner'];
    agents = json['agents'];
    delete = json['delete'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lock'] = lock;
    data['owner'] = owner;
    data['agents'] = agents;
    data['delete'] = delete;
    data['company'] = company;
    return data;
  }
}

class UsersPermision {
  bool? add;
  bool? view;

  UsersPermision({this.add, this.view});

  UsersPermision.fromJson(Map<String, dynamic> json) {
    add = json['add'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['add'] = add;
    data['view'] = view;
    return data;
  }
}

class ActionCollection {
  UsersPermision? users;
  int? length;
  UsersPermision? vendors;
  UsersPermision? agencies;
  UsersPermision? internalEmployee;
  UsersPermision? commissions;
  UsersPermision? famous;
  UsersPermision? locked_company;

  ActionCollection({this.users, this.length, this.vendors, this.agencies, this.locked_company, this.internalEmployee, this.famous});

  ActionCollection.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? UsersPermision.fromJson(json['users']) : null;
    famous = json['famous'] != null ? UsersPermision.fromJson(json['famous']) : null;
    length = json['length'];
    vendors = json['vendors'] != null ? UsersPermision.fromJson(json['vendors']) : null;
    commissions = json['commissions'] != null ? UsersPermision.fromJson(json['commissions']) : null;
    locked_company = json['locked_company'] != null ? UsersPermision.fromJson(json['locked_company']) : null;
    agencies = json['agencies'] != null ? UsersPermision.fromJson(json['agencies']) : null;
    internalEmployee = json['internal_employee'] != null ? UsersPermision.fromJson(json['internal_employee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.toJson();
    }
    data['length'] = length;
    if (vendors != null) {
      data['vendors'] = vendors!.toJson();
    }
    if (agencies != null) {
      data['agencies'] = agencies!.toJson();
    }
    if (commissions != null) {
      data['commissions'] = commissions!.toJson();
    }
    if (internalEmployee != null) {
      data['internal_employee'] = internalEmployee!.toJson();
    }
    if (locked_company != null) {
      data['locked_company'] = locked_company!.toJson();
    }
    if (famous != null) {
      data['famous'] = famous!.toJson();
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

class UserCurrency {
  int? id;
  double? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  UserCurrency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  UserCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dollar = double.parse(json['dollar'].toString());
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
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

class Contract {
  String? ar;
  String? en;

  Contract({this.ar, this.en});

  Contract.fromJson(Map<String, dynamic> json) {
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
  AddressCity? cityId;

  UserAddress({
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

  UserAddress.fromJson(Map<String, dynamic> json) {
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
    cityId = json['city_id'] != null ? AddressCity.fromJson(json['city_id']) : null;
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

class AddressCity {
  int? id;
  String? symbols;
  Name? name;
  AddressCountryId? countryId;
  bool? isVisible;

  AddressCity({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  AddressCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    countryId = json['country_id'] != null ? AddressCountryId.fromJson(json['country_id']) : null;
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

class AddressCountryId {
  int? id;
  String? symbols;
  Name? name;
  LangDatum? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  AddressCountryId({this.id, this.symbols, this.name, this.defaultLanguage, this.flag, this.isVisible});

  AddressCountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    defaultLanguage = json['default_language'] != null ? LangDatum.fromJson(json['default_language']) : null;
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
}

class CompanyCoverPhotos {
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  CompanyCoverPhotos({this.s128px, this.s256px, this.s512px, this.s1024px});

  CompanyCoverPhotos.fromJson(Map<String, dynamic> json) {
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
    s1024px = json['1024px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    data['1024px'] = s1024px;
    return data;
  }
}

class Commercial {
  String? id;
  String? key;
  String? file;

  Commercial({this.id, this.key, this.file});

  Commercial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['file'] = file;
    return data;
  }
}


class AddressId {
  int? id;

  //int? cityId;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  String? createdAt;
  String? updatedAt;

  AddressId({
    this.id,
    // this.cityId,
    this.latitude,
    this.longitude,
    this.state,
    this.street,
    this.building,
    this.intercom,
    this.floor,
    this.zipcode,
    this.detailedAddress,
    this.createdAt,
    this.updatedAt,
  });

  AddressId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    // state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    //data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class OwnerPaymentInfos {
  int? id;
  PaymentType? type;
  dynamic value;
  bool? isVisible;

  OwnerPaymentInfos({this.id, this.type, this.value, this.isVisible});

  OwnerPaymentInfos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'] != null ? PaymentType.fromJson(json['type']) : null;
    value = json['value'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['value'] = value;
    data['is_visible'] = isVisible;
    return data;
  }
}

class PaymentType {
  int? id;
  String? type;
  int? name;
  int? isVisible;
  String? createdAt;
  String? updatedAt;

  PaymentType({this.id, this.type, this.name, this.isVisible, this.createdAt, this.updatedAt});

  PaymentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    isVisible = json['is_visible'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['is_visible'] = isVisible;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CompanyPackages {
  int? id;
  String? code;
  String? price;
  Name? name;
  Name? description;
  int? subscribeDays;

  CompanyPackages({
    this.id,
    this.code,
    this.price,
    this.name,
    this.description,
    this.subscribeDays,
  });

  CompanyPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    price = json['price'];
    subscribeDays = json['subscribe_days'];

    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['price'] = price;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['subscribe_days'] = subscribeDays;

    if (description != null) {
      data['description'] = description!.toJson();
    }

    return data;
  }
}

class UserCompanyBranchModel {
  int? id;
  CompanyModel? company;
  Address? address;

  UserCompanyBranchModel({this.id, this.company, this.address});

  UserCompanyBranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] != null ? CompanyModel.fromJson(json['company']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Address {
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

  Address({
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

  Address.fromJson(Map<String, dynamic> json) {
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
}

class Value {
  int? id;
  Name? name;
  Iconss? icons;

  Value({this.id, this.name, this.icons});

  Value.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;

    icons = json['icons'] != null ? Iconss.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }

    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    return data;
  }
}
