import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'block_user_bloc_state.freezed.dart';

@freezed
class BlockUserState with _$BlockUserState {
  const factory BlockUserState.initial() = BlockUserStateInitial;
  const factory BlockUserState.loading() = BlockUserStateLoading;
  const factory BlockUserState.success() = BlockUserStateSuccess;
  const factory BlockUserState.error({required KFailure failure}) = BlockUserStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs