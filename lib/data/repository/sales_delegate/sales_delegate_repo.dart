import '../../models/sales_delegate/create_vendor.dart';
import '../../models/sales_delegate/sales_delegate_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class SalesDelegateRepoAbs {
  Future<Either<KFailure, GetSalesDelegateModel>> get_sales_delegate();
  Future<Either<KFailure, Unit>> create(CreateVendorModel vendorModel);
  Future<Either<KFailure, Unit>> update(CreateVendorModel vendorModel);
  Future<Either<KFailure, Unit>> delete({required int id});
}

class SalesDelegateRepoImp implements SalesDelegateRepoAbs {
  @override
  Future<Either<KFailure, GetSalesDelegateModel>> get_sales_delegate() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.sales_delegate);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(GetSalesDelegateModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> create(CreateVendorModel vendorModel) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.sales_delegate, data: vendorModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, Unit>> update(CreateVendorModel vendorModel) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.sales_delegate, params: vendorModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, Unit>> delete({required int id}) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.sales_delegate, params: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
