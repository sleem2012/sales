import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressResult {
  LatLng latLng;
  String address;
  String zipcode;
  String? state;
  String? street;
  String? country;
  int? cityId;
  int? countryId;
  String? building;
  String? floor;
  String? intercome;

//<editor-fold desc="Data Methods">
  AddressResult({
    required this.latLng,
    required this.address,
    required this.zipcode,
    this.state,
    this.street,
    this.country,
    this.cityId,
    this.building,
    this.floor,
    this.intercome,
    this.countryId,
  });

  AddressResult copyWith({
    LatLng? latLng,
    String? address,
    String? zipcode,
    String? state,
    String? street,
    String? country,
    int? cityId,
    String? building,
    String? floor,
    String? intercome,
    int? countryId,
  }) {
    return AddressResult(
      countryId: countryId ?? this.countryId,
      latLng: latLng ?? this.latLng,
      address: address ?? this.address,
      zipcode: zipcode ?? this.zipcode,
      state: state ?? this.state,
      street: street ?? this.street,
      country: country ?? this.country,
      cityId: cityId ?? this.cityId,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      intercome: intercome ?? this.intercome,
    );
  }

  @override
  String toString() {
    return 'AddressResult{latLng: $latLng, address: $address, zipcode: $zipcode, state: $state, street: $street, country: $country, cityId: $cityId, countryId: $countryId, building: $building, floor: $floor, intercome: $intercome}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressResult &&
          runtimeType == other.runtimeType &&
          latLng == other.latLng &&
          address == other.address &&
          zipcode == other.zipcode &&
          state == other.state &&
          street == other.street &&
          country == other.country &&
          cityId == other.cityId &&
          countryId == other.countryId &&
          building == other.building &&
          floor == other.floor &&
          intercome == other.intercome;

  @override
  int get hashCode =>
      latLng.hashCode ^
      address.hashCode ^
      zipcode.hashCode ^
      state.hashCode ^
      street.hashCode ^
      country.hashCode ^
      cityId.hashCode ^
      countryId.hashCode ^
      building.hashCode ^
      floor.hashCode ^
      intercome.hashCode;
}
