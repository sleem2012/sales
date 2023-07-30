import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'location_state.freezed.dart';

@freezed
class GetLocationState with _$GetLocationState {
  const factory GetLocationState.initial() = GetLocationInitial;
  const factory GetLocationState.loading() = GetLocationLoading;
  const factory GetLocationState.success({required Position pos}) = GetLocationSuccess;
  const factory GetLocationState.error({required String error}) = GetLocationError;
}
