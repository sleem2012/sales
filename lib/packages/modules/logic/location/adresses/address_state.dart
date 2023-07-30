import '../../../models/location/adress_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = AddressStateInitial;
  const factory AddressState.loading() = AddressStateLoading;
  const factory AddressState.success({required AddressModel? model}) = AddressStateSuccess;
  const factory AddressState.error({required String error}) = AddressStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs