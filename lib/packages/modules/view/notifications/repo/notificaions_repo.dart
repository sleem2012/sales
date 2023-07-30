import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../data/models/notifications.dart';
import '../../../../../di.dart';
import '../../../../shared/api_client/dio_client_helper.dart';
import '../../../../shared/api_client/endpoints.dart';
import '../../../../shared/error/failures.dart';

abstract class NotificationsRepoAbs {
  Future<Either<KFailure, NotificationsModel>> getNotifications();

  Future<Either<KFailure, NotificationsData>> updateNotifications(int id);
}

class NotificationsRepoImpl implements NotificationsRepoAbs {
  static NotificationsRepoImpl? _instance;

  NotificationsRepoImpl._internal() {
    _instance = this;
  }

  static NotificationsRepoImpl get i {
    return _instance ?? NotificationsRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, NotificationsModel>> getNotifications() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.notifications);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(NotificationsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, NotificationsData>> updateNotifications(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.notifications, data: {'id': id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      return right(NotificationsData.fromJson(r['data']));
    });
  }
}
