import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/error/failures.dart';
import '../../../models/user_info/user_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginStateInitial;
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.success({required UserModel loginModel}) = LoginStateSuccess;
  const factory LoginState.error({required KFailure failure}) = LoginStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
