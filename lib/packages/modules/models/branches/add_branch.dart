class AddBranchModel {
  int? id;
  String? companyId;
  String? cityId;
  String? countryId;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;

  AddBranchModel({
    this.countryId,
    this.id,
    this.companyId,
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
  });

  AddBranchModel.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['id'] = id;
    data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    return data;
  }

  @override
  bool operator ==(covariant AddBranchModel other) {
    if (identical(this, other)) return true;

    return other.companyId == companyId &&
        other.cityId == cityId &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.state == state &&
        other.street == street &&
        other.building == building &&
        other.intercom == intercom &&
        other.floor == floor &&
        other.zipcode == zipcode &&
        other.id == id &&
        other.detailedAddress == detailedAddress;
  }

  @override
  int get hashCode {
    return companyId.hashCode ^
        cityId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        state.hashCode ^
        street.hashCode ^
        building.hashCode ^
        intercom.hashCode ^
        floor.hashCode ^
        zipcode.hashCode ^
        id.hashCode ^
        detailedAddress.hashCode;
  }

  AddBranchModel copyWith({
    String? companyId,
    int? id,
    String? cityId,
    String? latitude,
    String? longitude,
    String? state,
    String? street,
    String? building,
    String? intercom,
    String? floor,
    String? zipcode,
    String? detailedAddress,
  }) {
    return AddBranchModel(
      companyId: companyId ?? this.companyId,
      id: id ?? this.id,
      cityId: cityId ?? this.cityId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      state: state ?? this.state,
      street: street ?? this.street,
      building: building ?? this.building,
      intercom: intercom ?? this.intercom,
      floor: floor ?? this.floor,
      zipcode: zipcode ?? this.zipcode,
      detailedAddress: detailedAddress ?? this.detailedAddress,
    );
  }

  @override
  String toString() {
    return 'AddBranchModel{companyId: $companyId, cityId: $cityId, latitude: $latitude, longitude: $longitude, street: $street, building: $building, intercom: $intercom, floor: $floor, zipcode: $zipcode, detailedAddress: $detailedAddress}';
  }
}
