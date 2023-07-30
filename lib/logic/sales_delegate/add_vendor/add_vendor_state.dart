import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_vendor_state.freezed.dart';

@freezed
class AddVendorState with _$AddVendorState {
  const factory AddVendorState.initial() = AddVendorStateInitial;
  const factory AddVendorState.loading() = AddVendorStateLoading;
  const factory AddVendorState.success() = AddVendorStateSuccess;
  const factory AddVendorState.error({required String error}) = AddVendorStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs