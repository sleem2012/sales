import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_user_state.freezed.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = UpdateUserStateInitial;
  const factory UpdateUserState.loading() = UpdateUserStateLoading;
  const factory UpdateUserState.success() = UpdateUserStateSuccess;
  const factory UpdateUserState.error({required KFailure failure}) = UpdateUserStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs