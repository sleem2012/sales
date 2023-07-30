import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/branches/branch_model.dart';

part 'branches_state.freezed.dart';

@freezed
class BranchesState with _$BranchesState {
  const factory BranchesState.initial() = BranchesStateInitial;
  const factory BranchesState.loading() = BranchesStateLoading;
  const factory BranchesState.success({required BranchModel model}) = BranchesStateSuccess;
  const factory BranchesState.error({required String error}) = BranchesStateError;
}
