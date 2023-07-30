import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/error/failures.dart';

part 'change_pass_state.freezed.dart';

@freezed
class ChangePassState with _$ChangePassState {
  const factory ChangePassState.initial() = ChangePassStateInitial;
  const factory ChangePassState.loading() = ChangePassStateLoading;
  const factory ChangePassState.success() = ChangePassStateSuccess;
  const factory ChangePassState.error({required KFailure failure}) = ChangePassStateError;
}

// flutter pu
