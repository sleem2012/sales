import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class AddEmployeeModel {
  String? name;
  String? email;
  int? id;
  String? password;
  String? mobile;
  String? birthdate;
  String? fcmToken;
  String? lang_id;
  String? currency_id;
  int? city_id;
  int? countryId;
  int? branch_id;
  int? requiredContract;
  double? latitude;
  double? longitude;

  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailed_address;
  String? password_confirmation;
  String? gender;
  File? image;
  String? timeZone;
  String? nationalityId;

  AddEmployeeModel({
    this.countryId,
    this.name,
    this.email,
    this.password,
    this.id,
    this.mobile,
    this.birthdate,
    this.fcmToken,
    this.lang_id,
    this.currency_id,
    this.city_id,
    this.branch_id,
    this.latitude,
    this.longitude,
    this.requiredContract,
    this.state,
    this.street,
    this.building,
    this.intercom,
    this.floor,
    this.zipcode,
    this.detailed_address,
    this.password_confirmation,
    this.gender,
    this.image,
    this.timeZone,
    this.nationalityId,
  });

  AddEmployeeModel copyWith({
    int? countryId,
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? birthdate,
    String? fcmToken,
    String? lang_id,
    String? currency_id,
    int? nationality_id,
    int? id,
    int? city_id,
    int? branch_id,
    double? latitude,
    double? longitude,
    String? state,
    String? street,
    String? building,
    String? intercom,
    String? floor,
    int? requiredContract,
    String? zipcode,
    String? detailed_address,
    String? password_confirmation,
    String? gender,
    File? image,
    String? timeZone,
    String? nationalityId,
  }) {
    return AddEmployeeModel(
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      timeZone: timeZone ?? this.timeZone,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      birthdate: birthdate ?? this.birthdate,
      fcmToken: fcmToken ?? this.fcmToken,
      lang_id: lang_id ?? this.lang_id,
      currency_id: currency_id ?? this.currency_id,
      city_id: city_id ?? this.city_id,
      branch_id: branch_id ?? this.branch_id,
      requiredContract: requiredContract ?? this.requiredContract,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      id: id ?? this.id,
      nationalityId: nationalityId ?? this.nationalityId,
      // state: state ?? this.state,
      street: street ?? this.street,
      building: building ?? this.building,
      intercom: intercom ?? this.intercom,
      floor: floor ?? this.floor,
      zipcode: zipcode ?? this.zipcode,
      detailed_address: detailed_address ?? this.detailed_address,
      password_confirmation: password_confirmation ?? this.password_confirmation,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timezone': timeZone,
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'birthdate': birthdate,
      'fcmToken': fcmToken,
      'lang_id': lang_id,
      'currency_id': currency_id,
      'required_contracts': requiredContract,
      'city_id': city_id,
      if (branch_id != null) 'company_branch_id': branch_id,
      'latitude': latitude,
      'longitude': longitude,
      'id': id,
      "nationality_id": nationalityId,
      // // 'state': state,
      'street': street,
      'building': building,
      'intercom': intercom,
      'floor': floor,
      'zipcode': zipcode,
      'detailed_address': detailed_address,
      'password_confirmation': password_confirmation,
      'gender': gender,
      if (image != null)
        'image': MultipartFile.fromFileSync(
          image?.path ?? '',
          filename: image?.path.split('/').last,
        ),
    };
  }

  factory AddEmployeeModel.fromMap(Map<String, dynamic> map) {
    return AddEmployeeModel(
      name: map['name'] != null ? map['name'] as String : null,
      requiredContract: map['required_contracts'] != null ? map['required_contracts'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      birthdate: map['birthdate'] != null ? map['birthdate'] as String : null,
      fcmToken: map['fcmToken'] != null ? map['fcmToken'] as String : null,
      lang_id: map['lang_id'] != null ? map['lang_id'] as String : null,
      currency_id: map['currency_id'] != null ? map['currency_id'] as String : null,
      city_id: map['city_id'] != null ? map['city_id'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      branch_id: map['company_branch_id'] != null ? map['company_branch_id'] as int : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      // state: map['state'] != null ? map['state'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      building: map['building'] != null ? map['building'] as String : null,
      intercom: map['intercom'] != null ? map['intercom'] as String : null,
      floor: map['floor'] != null ? map['floor'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      detailed_address: map['detailed_address'] != null ? map['detailed_address'] as String : null,
      password_confirmation: map['password_confirmation'] != null ? map['password_confirmation'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddEmployeeModel.fromJson(String source) => AddEmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddEmployeeModel(name: $name, email: $email, password: $password, id,$id ,mobile: $mobile, birthdate: $birthdate, fcmToken: $fcmToken, lang_id: $lang_id, currency_id: $currency_id, company_branch_id: $branch_id, latitude: $latitude, longitude: $longitude, street: $street, building: $building, intercom: $intercom, floor: $floor, zipcode: $zipcode, detailed_address: $detailed_address, password_confirmation: $password_confirmation, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(covariant AddEmployeeModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.mobile == mobile &&
        other.id == id &&
        other.birthdate == birthdate &&
        other.fcmToken == fcmToken &&
        other.lang_id == lang_id &&
        other.currency_id == currency_id &&
        other.city_id == city_id &&
        other.branch_id == branch_id &&
        other.latitude == latitude &&
        other.requiredContract == requiredContract &&
        other.longitude == longitude &&
        // other.state == state &&
        other.street == street &&
        other.building == building &&
        other.intercom == intercom &&
        other.floor == floor &&
        other.zipcode == zipcode &&
        other.detailed_address == detailed_address &&
        other.password_confirmation == password_confirmation &&
        other.gender == gender &&
        other.timeZone == timeZone &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        birthdate.hashCode ^
        fcmToken.hashCode ^
        lang_id.hashCode ^
        currency_id.hashCode ^
        city_id.hashCode ^
        id.hashCode ^
        branch_id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        // state.hashCode ^
        street.hashCode ^
        building.hashCode ^
        intercom.hashCode ^
        floor.hashCode ^
        zipcode.hashCode ^
        detailed_address.hashCode ^
        password_confirmation.hashCode ^
        gender.hashCode ^
        requiredContract.hashCode ^
        timeZone.hashCode ^
        image.hashCode;
  }
}
