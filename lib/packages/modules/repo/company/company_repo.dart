import "package:dartz/dartz.dart";
import 'package:dio/dio.dart';

import '../../../../di.dart';
import '../../../dynamic_ui/model/dynamic_ui_model.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import '../../models/category/category_model.dart';
import '../../models/company/company_model.dart';
import '../../models/company/package_model.dart';

abstract class _CompanyRepo {
  Future<Either<KFailure, String>> renew({required int paymentId, required int packageId, required String lat, required String lng, required String paymentType});

  Future<Either<KFailure, CompanyTypeModel>> getCompanyType();

  Future<Either<KFailure, List<CompanyModel>>> getCompany();

  Future<Either<KFailure, CompanyPackageModel>> getCompanyPackage(String? companyId);

  Future<Either<KFailure, List<DUIFieldModel>>> get_company_fields();

  Future<Either<KFailure, String?>> create_dui_company({required Map<String, dynamic> values});

  Future<Either<KFailure, CategoryModel>> get_category({int? isProduct, String? packageId});

  Future<Either<KFailure, CategoryData>> addCategory({required String companyId, required List<int> catIds});
}

class CompanyRepoImpl implements _CompanyRepo {
  static CompanyRepoImpl? _instance;

  CompanyRepoImpl.internal() {
    _instance = this;
  }

  static CompanyRepoImpl get i {
    return _instance ?? CompanyRepoImpl.internal();
  }

  @override
  Future<Either<KFailure, CompanyTypeModel>> getCompanyType() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_type);

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(CompanyTypeModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, CompanyPackageModel>> getCompanyPackage(String? companyId) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_package_read, params: {'company_type_id': companyId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(CompanyPackageModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, String>> renew({required int? paymentId, required int packageId, required String lat, required String lng, required String paymentType}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(
      KEndPoints.company_renew,
      data: {
        if (paymentId != null) "payment_id": paymentId,
        "packages_id": packageId,
        'lat': lat,
        'long': lng,
        "payment_type": paymentType,
      },
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(r['data']['url']));
  }

  @override
  Future<Either<KFailure, List<DUIFieldModel>>> get_company_fields() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.get_company_fields, params: {"app": "vendor"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<DUIFieldModel> fields = [];
        List list = r["data"] as List;
        for (var v in list) {
          fields.add(DUIFieldModel.fromJson(v));
        }
        return right(fields);
      },
    );
  }

  @override
  Future<Either<KFailure, CategoryModel>> get_category({int? isProduct, String? packageId}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.categories,
      params: {
        if (isProduct != null) "is_product": isProduct,
        if (packageId != null) "company_type_id": packageId,
      },
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CategoryModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, String?>> create_dui_company({required Map<String, dynamic> values}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.create_company_dui, data: values);
    final result = await ApiClientHelper.responseOrFailure(func: func);

    return result.fold((l) => left(l), (r) => right(r['data']['url']));
  }

  @override
  Future<Either<KFailure, CategoryData>> addCategory({required String companyId, required List<int> catIds}) async {
    final body = {"category_ids[]": catIds, "company_id": companyId};
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.gat_cats, data: body);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(CategoryData.fromJson(r)));
  }

  @override
  Future<Either<KFailure, List<CompanyModel>>> getCompany() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_read, params: {"app": "sales"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<CompanyModel> companies = [];

        List list = r['data'] as List;
        for (var e in list) {
          companies.add(CompanyModel.fromJson(e));
        }
        return right(companies);
      },
    );
  }
}
