import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../shared/api_client/dio_client_helper.dart';
import '../../shared/api_client/endpoints.dart';
import '../../shared/error/failures.dart';
import 'payment/add_payment.dart';
import 'payment/banks_model.dart';
import 'payment/my_payment_model.dart';
import 'payment/payment_history_model.dart';
import 'payment/payment_type_model.dart';
import 'payment/vendor_commission.dart';

abstract class PaymentRepoAbs {
  Future<Either<KFailure, MyPaymentsModel>> delete(int id);

  Future<Either<KFailure, PaymentTypesModel>> getPaymentTypes();

  Future<Either<KFailure, MyPaymentsModel>> getMyPayment();
  Future<Either<KFailure, BanksModel>> get_banks();

  Future<Either<KFailure, Unit>> updatePayment(Map<String, dynamic> data);
  Future<Either<KFailure, AddPaymentModel>> addVisa(Map<String, dynamic> data);
  Future<Either<KFailure, CommissionModel>> getCommissions({String? date});
  Future<Either<KFailure, PaymentHistoryModel>> getMyPaymentHistory({int page_count, int page});
}

class PayemntRepoImpl implements PaymentRepoAbs {
  static PayemntRepoImpl? _instance;

  PayemntRepoImpl._internal() {
    _instance = this;
  }
  static PayemntRepoImpl get i {
    return _instance ?? PayemntRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, PaymentTypesModel>> getPaymentTypes() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.payment_type, params: {"app": "vendor"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(PaymentTypesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> updatePayment(Map<String, dynamic> data) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.add_payment, data: FormData.fromMap(data..addAll({"_method": "put"})));
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, MyPaymentsModel>> getMyPayment() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.my_payment, params: {"type_id": "all"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(MyPaymentsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, MyPaymentsModel>> delete(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.my_payment, params: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(MyPaymentsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, AddPaymentModel>> addVisa(Map<String, dynamic> data) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.add_payment, data: FormData.fromMap(data));
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(AddPaymentModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CommissionModel>> getCommissions({String? date}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.my_commission, params: {"range": date});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CommissionModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, PaymentHistoryModel>> getMyPaymentHistory({int? page_count, int? page}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.history, params: {"page_count": page_count, "page": page});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(PaymentHistoryModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, BanksModel>> get_banks() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.get_banks);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(BanksModel.fromJson(r)),
    );
  }
}
