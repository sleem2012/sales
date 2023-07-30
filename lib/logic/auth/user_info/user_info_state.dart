import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../packages/modules/models/user_info/user_model.dart';
part 'user_info_state.freezed.dart';

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState.initial() = UserInfoStateInitial;
  const factory UserInfoState.loading() = UserInfoStateLoading;
  const factory UserInfoState.success({required UserModel userModel}) = UserInfoStateSuccess;
  const factory UserInfoState.error({required KFailure failure}) = UserInfoStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs