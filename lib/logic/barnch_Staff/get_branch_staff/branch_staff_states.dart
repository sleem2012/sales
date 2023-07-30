import '../../../data/models/branch_staff/branch_staff_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'branch_staff_states.freezed.dart';

@freezed
class BranchStaffState with _$BranchStaffState {
  const factory BranchStaffState.loading() = BranchStaffStateLoading;
  const factory BranchStaffState.success({required BranchStaffModel branchStaffModel}) = BranchStaffStateSuccess;
  const factory BranchStaffState.error({required String error}) = BranchStaffStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs