import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../di.dart';
import '../../../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../../../packages/shared/api_client/endpoints.dart';
import '../../../../../packages/shared/error/failures.dart';
import '../country_search_model/country_search_model.dart';

abstract class CountrySearchRepo {
  Future<Either<KFailure, CountrySearchModel>> search({required String type, required String country, required String city});
}

class CountrySearchRepoImpl implements CountrySearchRepo {
  static CountrySearchRepoImpl? _instance;

  CountrySearchRepoImpl._internal() {
    _instance = this;
  }

  static CountrySearchRepoImpl get i {
    return _instance ?? CountrySearchRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, CountrySearchModel>> search({required String type, required String country, required String city}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.search, data: {"type": type, "text": country, "text1": city});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(CountrySearchModel.fromJson(r)));
  }
}
