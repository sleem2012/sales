import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import '../../data/payment/my_payment_model.dart';
import '../../data/payment/payment_type_model.dart';
import '../../data/payment_repo.dart';
import 'add_payment_state.dart';

class AddPaymentTypeBloc extends Cubit<AddPaymentState> {
  AddPaymentTypeBloc() : super(const AddPaymentState.initial());

  static AddPaymentTypeBloc of(BuildContext context) {
    return BlocProvider.of<AddPaymentTypeBloc>(context);
  }

  PaymentTypesModel? paymentTypesModel;

  List<TextEditingController> controllers = [];

  final keys = {};
  int? selectedBankId;

  int? selectedId;
  int? selectedTypeId;

  setCtrlLength(PaymentData values, PayFieldValues bankName) {
    selectedId = values.id;
    selectedTypeId = values.type_id;
    selectedBankId = bankName.id;
    controllers = [];
    for (int i = 0; i < (values.values ?? []).length; i++) {
      if ((values.values ?? [])[i].key != "bank_name") {
        controllers.add(TextEditingController(text: (values.values ?? [])[i].value));
        keys.addAll({(values.values ?? [])[i].key: ''});
      }
    }
  }

  final Map<String, dynamic> paymentData = <String, dynamic>{};
  addBank(int? id) {
    debugPrint(id.toString());
    selectedBankId = id;
  }

  addPayment() async {
    try {
      setPaymentMethodMap();
      printMap(paymentData);
      emit(const AddPaymentState.loading());
      final result = await PayemntRepoImpl.i.updatePayment(paymentData);
      result.fold(
        (l) {
          debugPrint('================= add Payment  Failes :$l ');
          emit(AddPaymentState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= add Payment  Success :$r ');
          emit(const AddPaymentState.success());
        },
      );
    } catch (e) {
      debugPrint('================= add Payment  catch $e  ');
      emit(AddPaymentState.error(error: Tr.get.something_went_wrong));
    }
  }

  setPaymentMethodMap() {
    paymentData.clear();
    final values = controllers.map((c) => c.text).toList()..add(selectedBankId.toString());
    final lK = keys..addAll({"bank_name": ''});
    paymentData.addAll({
      "id": selectedId,
      "type_id": selectedTypeId,
      "keys[]": lK.keys.toList(),
      "values[]": values,
      "is_visible": isVisibile ? 1 : 0,
    });
  }

  bool isVisibile = true;

  toggleVisibility(bool val) {
    isVisibile = val;
    _update;
  }

  get _update {
    emit(const AddPaymentState.loading());
    emit(const AddPaymentState.initial());
  }
}
