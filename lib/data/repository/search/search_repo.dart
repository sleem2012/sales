import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class SearchRepoAbs {
  Future<Either<KFailure, List<dynamic>>> search({
    required String type,
    required String text,
  });
}

class SearchRepoImpl implements SearchRepoAbs {
  @override
  Future<Either<KFailure, List<dynamic>>> search({
    required String type,
    required String text,
  }) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.search, data: {
      "type": type,
      "text": text,
    },);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      final data = <dynamic>[];
      if (r['data'] != null) {
        r['data'].forEach(
          (v) {
            data.add(v);
          },
        );
      }
      return right(data);
    });
  }
}
