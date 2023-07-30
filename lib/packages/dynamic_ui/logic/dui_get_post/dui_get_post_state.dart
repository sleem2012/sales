import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../model/dynamic_ui_model.dart';

part 'dui_get_post_state.freezed.dart';

@freezed
class DuiGetPostState with _$DuiGetPostState {
  const factory DuiGetPostState.initial() = DuiGetPostStateInitial;
  const factory DuiGetPostState.getting() = DuiGetPostStateGetting;
  const factory DuiGetPostState.posting() = DuiGetPostStatePosting;
  const factory DuiGetPostState.getSuccess({required DynamicUiModel model}) = DuiGetPostStateGetSuccess;
  const factory DuiGetPostState.postSuccess({required dynamic response}) = DuiGetPostStatePostSuccess;
  const factory DuiGetPostState.getError({required KFailure error, Map<String, dynamic>? params}) = DuiGetPostStateGetError;
  const factory DuiGetPostState.postError({required KFailure error, required Map<String, dynamic> postMap}) = DuiGetPostStatePostError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs