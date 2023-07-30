import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_vendor_state.freezed.dart';

@freezed
class UpdateVendorState with _$UpdateVendorState {
  const factory UpdateVendorState.initial() = AddVendorStateInitial;
  const factory UpdateVendorState.loading() = AddVendorStateLoading;
  const factory UpdateVendorState.success() = AddVendorStateSuccess;
  const factory UpdateVendorState.error({required String error}) = AddVendorStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs