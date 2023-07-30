import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../data/payment/my_payment_model.dart';
import '../../data/payment_repo.dart';
import 'get_my_payment_state.dart';

class MyPaymentsBloc extends Cubit<MyPaymentsState> {
  MyPaymentsBloc() : super(const MyPaymentsState.loading());

  static MyPaymentsBloc of(BuildContext context) {
    return BlocProvider.of<MyPaymentsBloc>(context);
  }

  MyPaymentsModel? myPaymentsModel;

  getMyPayments() async {
    try {
      emit(const MyPaymentsState.loading());
      final result = await PayemntRepoImpl.i.getMyPayment();
      result.fold(
        (l) {
          debugPrint('=================My Payment Failes :$l ');
          emit(MyPaymentsState.error(error: KFailure.toError(l)));
        },
        (r) {
          myPaymentsModel = r;
          debugPrint('=================My Payment  Success :$r ');
          emit(MyPaymentsState.success(myPaymentsModel: myPaymentsModel!));
        },
      );
    } catch (e) {
      debugPrint('=================My Payment  catch $e  ');
      emit(MyPaymentsState.error(error: Tr.get.something_went_wrong));
    }
  }

  delete(PaymentData paymentData) async {
    try {
      removeLocal(paymentData);
      final result = await PayemntRepoImpl.i.delete(paymentData.id ?? 1);
      result.fold(
        (l) {
          debugPrint('================= delete : ${KFailure.toError(l)}');
          emit(MyPaymentsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= delete : ${r.toString()}');
        },
      );
    } catch (e) {
      debugPrint('================= delete (Catch): ${e.toString()} ');
      emit(MyPaymentsState.error(error: Tr.get.something_went_wrong));
    }
  }

  removeLocal(PaymentData data) {
    myPaymentsModel?.copyWith(data: myPaymentsModel?.data?..remove(data));
    _update;
  }

  get _update {
    emit(const MyPaymentsState.loading());
    emit(MyPaymentsState.success(myPaymentsModel: myPaymentsModel!));
  }

  List<PaymentData> getFilteredList(int id) {
    return myPaymentsModel?.data?.where((element) => element.type_id == id && element.state == 'valid').toList() ?? [];
  }
}
