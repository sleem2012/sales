import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/error/failures.dart';

part 'forget_pass_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = ForgetPasswordStateInitial;
  const factory ForgetPasswordState.loading() = ForgetPasswordStateLoading;
  const factory ForgetPasswordState.success() = ForgetPasswordStateSuccess;
  const factory ForgetPasswordState.error({required KFailure failure}) = ForgetPasswordStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
