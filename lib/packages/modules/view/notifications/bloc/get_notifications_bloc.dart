import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/notifications.dart';
import '../../../../extensions.dart';
import '../../../../shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../repo/notificaions_repo.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Cubit<NotificationsState> {
  NotificationsBloc() : super(const NotificationsState.loading());

  static NotificationsBloc of(BuildContext context) {
    return BlocProvider.of<NotificationsBloc>(context);
  }

  NotificationsModel? notificationsModel;

  getNotifications() async {
    try {
      emit(const NotificationsState.loading());
      final result = await NotificationsRepoImpl.i.getNotifications();
      result.fold(
        (l) {
          debugPrint('=================My notifications fails :$l ');
          emit(NotificationsState.error(error: KFailure.toError(l)));
        },
        (r) {
          notificationsModel = r;
          debugPrint('=================My notifications  Success :$r ');
          emit(NotificationsState.success(notificationsModel: notificationsModel!));
        },
      );
    } catch (e) {
      debugPrint('=================My notifications  catch $e  ');
      emit(NotificationsState.error(error: Tr.get.something_went_wrong));
    }
  }

  updateNotification(int id) async {
    emit(const NotificationsState.loading());

    final n = notificationsModel?.notificationsData?.firstWhereOrNull((element) => element.id == id);
    if (n == null) return;

    notificationsModel = notificationsModel?.copyWith(
      notificationsData: notificationsModel?.notificationsData?..replace(n, n.copyWith(isRead: !(n.isRead ?? false))),
    );
    emit(NotificationsState.success(notificationsModel: notificationsModel!));

    try {
      final result = await NotificationsRepoImpl.i.updateNotifications(id);
      result.fold(
        (l) {
          debugPrint('=================My notifications fails :$l ');
          emit(NotificationsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('=================My notifications  Success :${r.toJson()} ');
        },
      );
    } catch (e) {
      debugPrint('=================My notifications  catch $e  ');
      emit(NotificationsState.error(error: Tr.get.something_went_wrong));
    }
  }
}
