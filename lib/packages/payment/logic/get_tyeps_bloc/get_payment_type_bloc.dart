import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../data/payment/payment_type_model.dart';
import '../../data/payment_repo.dart';
import 'get_payment_type_state.dart';

class GetPaymentTypeBloc extends Cubit<GetPaymentTypeState> {
  GetPaymentTypeBloc() : super(const GetPaymentTypeState.initial());

  static GetPaymentTypeBloc of(BuildContext context) {
    return BlocProvider.of<GetPaymentTypeBloc>(context);
  }

  PaymentTypesModel? paymentTypesModel;

  gettypes() async {
    try {
      emit(const GetPaymentTypeState.loading());
      final result = await PayemntRepoImpl.i.getPaymentTypes();
      result.fold(
        (l) {
          debugPrint('================= Payment Types Failes :$l ');
          emit(GetPaymentTypeState.error(error: KFailure.toError(l)));
        },
        (r) {
          paymentTypesModel = r;
          debugPrint('================= Payment Types Success :$r ');
          emit(GetPaymentTypeState.success(paymentTypesModel: r));
        },
      );
    } catch (e) {
      debugPrint('================= Payment Types catch $e  ');
      emit(GetPaymentTypeState.error(error: Tr.get.something_went_wrong));
    }
  }
}
