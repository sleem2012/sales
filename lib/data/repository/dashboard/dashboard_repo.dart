import '../../../../packages/shared/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';

abstract class DashboardRepoAbs {
  Future<Either<KFailure, Unit>> updateApplication({required Map<String, dynamic> values});
}

class DashboardRepoImp implements DashboardRepoAbs {
  @override
  Future<Either<KFailure, Unit>> updateApplication({required Map<String, dynamic> values}) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.pendingApplication, data: values);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
