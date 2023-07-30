import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/commission/commission_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../../packages/shared/error/failures.dart';

abstract class _CommissionRepo {
  Future<Either<KFailure, CommissionModel>> getCommission();
}

class CommissionRepoImpl implements _CommissionRepo {
  @override
  Future<Either<KFailure, CommissionModel>> getCommission() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.commission);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CommissionModel.fromJson(r)),
    );
  }
}
