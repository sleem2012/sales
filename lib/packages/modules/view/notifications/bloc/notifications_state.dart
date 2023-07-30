import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/notifications.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsStateInitial;

  const factory NotificationsState.loading() = NotificationsStateLoading;

  const factory NotificationsState.success({required NotificationsModel notificationsModel}) = NotificationsStateSuccess;

  const factory NotificationsState.error({required String error}) = NotificationsStateError;
}
