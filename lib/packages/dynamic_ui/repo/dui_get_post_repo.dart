import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../shared/api_client/dio_client_helper.dart';
import '../../shared/error/failures.dart';
import '../model/dynamic_ui_model.dart';

abstract class DuiGetPostRepoAbs {
  Future<Either<KFailure, DynamicUiModel>> get(String url, Map<String, dynamic>? params);
  Future<Either<KFailure, dynamic>> post(String url, Map<String, dynamic> map);
}

class DuiGetPostRepoImp implements DuiGetPostRepoAbs {
  static DuiGetPostRepoImp? _instance;
  DuiGetPostRepoImp._internal() {
    _instance = this;
  }
  static DuiGetPostRepoImp get i {
    return _instance ?? DuiGetPostRepoImp._internal();
  }

  @override
  Future<Either<KFailure, DynamicUiModel>> get(String get_url, Map<String, dynamic>? params) async {
    Future<Response<dynamic>> func = Di.dioClient.get(get_url, params: params);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(DynamicUiModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, dynamic>> post(String post_url, Map<String, dynamic> map) async {
    Future<Response<dynamic>> func = Di.dioClient.post(post_url, data: FormData.fromMap(map));
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(r));
  }
}
