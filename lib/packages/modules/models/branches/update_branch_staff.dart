// ignore_for_file: public_member_api_docs, sort_constructors_first
class UpdateEmployeeModel {
  int? id;
  String? companyBranchId;
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? birthdate;
  String? fcmToken;
  String? langId;
  String? currencyId;
  String? cityId;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  String? passwordConfirmation;
  String? gender;

  UpdateEmployeeModel(
      {this.id,
      this.companyBranchId,
      this.name,
      this.email,
      this.password,
      this.mobile,
      this.birthdate,
      this.fcmToken,
      this.langId,
      this.currencyId,
      this.cityId,
      this.latitude,
      this.longitude,
      this.state,
      this.street,
      this.building,
      this.intercom,
      this.floor,
      this.zipcode,
      this.detailedAddress,
      this.passwordConfirmation,
      this.gender,});

  UpdateEmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyBranchId = json['company_branch_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if(state!=null)  state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    passwordConfirmation = json['password_confirmation'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_branch_id'] = companyBranchId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['birthdate'] = birthdate;
    data['fcmToken'] = fcmToken;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    // data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    data['password_confirmation'] = passwordConfirmation;
    data['gender'] = gender;
    return data;
  }

  UpdateEmployeeModel copyWith({
    int? id,
    String? companyBranchId,
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? birthdate,
    String? fcmToken,
    String? langId,
    String? currencyId,
    String? cityId,
    String? latitude,
    String? longitude,
    // String? state,
    String? street,
    String? building,
    String? intercom,
    String? floor,
    String? zipcode,
    String? detailedAddress,
    String? passwordConfirmation,
    String? gender,
  }) {
    return UpdateEmployeeModel(
      id: id ?? this.id,
      companyBranchId: companyBranchId ?? this.companyBranchId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      birthdate: birthdate ?? this.birthdate,
      fcmToken: fcmToken ?? this.fcmToken,
      langId: langId ?? this.langId,
      currencyId: currencyId ?? this.currencyId,
      cityId: cityId ?? this.cityId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      // state: state ?? this.state,
      street: street ?? this.street,
      building: building ?? this.building,
      intercom: intercom ?? this.intercom,
      floor: floor ?? this.floor,
      zipcode: zipcode ?? this.zipcode,
      detailedAddress: detailedAddress ?? this.detailedAddress,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      gender: gender ?? this.gender,
    );
  }

  @override
  bool operator ==(covariant UpdateEmployeeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.companyBranchId == companyBranchId &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.mobile == mobile &&
        other.birthdate == birthdate &&
        other.fcmToken == fcmToken &&
        other.langId == langId &&
        other.currencyId == currencyId &&
        other.cityId == cityId &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        // other.state == state &&
        other.street == street &&
        other.building == building &&
        other.intercom == intercom &&
        other.floor == floor &&
        other.zipcode == zipcode &&
        other.detailedAddress == detailedAddress &&
        other.passwordConfirmation == passwordConfirmation &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companyBranchId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        birthdate.hashCode ^
        fcmToken.hashCode ^
        langId.hashCode ^
        currencyId.hashCode ^
        cityId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        // state.hashCode ^
        street.hashCode ^
        building.hashCode ^
        intercom.hashCode ^
        floor.hashCode ^
        zipcode.hashCode ^
        detailedAddress.hashCode ^
        passwordConfirmation.hashCode ^
        gender.hashCode;
  }
}
