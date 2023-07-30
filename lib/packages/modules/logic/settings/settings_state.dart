import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/settings/settings_model.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsStateInitial;
  const factory SettingsState.loading() = SettingsStateLoading;
  const factory SettingsState.success({required SettingsModel model}) = SettingsStateSuccess;
  const factory SettingsState.error({required String error}) = SettingsStateError;
}
  // flutter pub run build_runner watch --delete-conflicting-outputs