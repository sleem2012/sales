import "package:dartz/dartz.dart";
import 'package:dio/dio.dart';
import '../../../packages/modules/models/company/company_response.dart';
import '../../models/company/create_company_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../packages/dynamic_ui/model/dynamic_ui_model.dart';

abstract class _CompanyRepo {
  Future<Either<KFailure, Unit>> create({required CreateCompanyModel createCompanyModel});

  Future<Either<KFailure, CompanyResponse>> getCompany({int lock, int? user_id});

  Future<Either<KFailure, Unit>> updateLockedCompany({required Map<String, dynamic> values});

  Future<Either<KFailure, List<DUIFieldModel>>> get_company_fields();

  Future<Either<KFailure, Unit>> create_dui_company({required Map<String, dynamic> values});
}

class CompanyRepoImpl implements _CompanyRepo {
  @override
  Future<Either<KFailure, Unit>> create({required CreateCompanyModel createCompanyModel}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.company_system_create, data: createCompanyModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, CompanyResponse>> getCompany({
    int? lock,
    int? user_id,
  }) async {
    Future<Response<dynamic>> func =
        Di.dioClient.get(KEndPoints.company_read, params: {if (lock != null) "is_lock": lock, if (user_id != null) "user_id": user_id});

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(CompanyResponse.fromJson(r)));
  }

  @override
  Future<Either<KFailure, Unit>> updateLockedCompany({required Map<String, dynamic> values}) async {
    Future<Response<dynamic>> func = Di.dioClient.patch(KEndPoints.assign, data: values);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, List<DUIFieldModel>>> get_company_fields() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.get_company_fields, params: {"app": "sales"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<DUIFieldModel> fields = [];
        List list = r["data"] as List;

        for (var v in list) {
          if (v != null) {
            fields.add(DUIFieldModel.fromJson(v));
          }
        }
        return right(fields);
      },
    );
  }

  @override
  Future<Either<KFailure, Unit>> create_dui_company({required Map<String, dynamic> values}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.create_company_dui, data: values);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }
}
