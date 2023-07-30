import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_application_state.freezed.dart';

@freezed
class UpdateApplicationState with _$UpdateApplicationState {
  const factory UpdateApplicationState.initial() = UpdateApplicationStateInitial;
  const factory UpdateApplicationState.loading() = UpdateApplicationStateLoading;
  const factory UpdateApplicationState.success() = UpdateApplicationStateSuccess;
  const factory UpdateApplicationState.error({required String error}) = UpdateApplicationStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs