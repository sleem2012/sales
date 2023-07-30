import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../data/payment/add_payment.dart';
import '../../data/payment_repo.dart';
import 'add_card_state.dart';

class AddCardBloc extends Cubit<AddCardState> {
  AddCardBloc() : super(const AddCardState.initial());

  static AddCardBloc of(BuildContext context) {
    return BlocProvider.of<AddCardBloc>(context);
  }

  AddPaymentModel? addPaymentModel;

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController expireController = TextEditingController();
  // final TextEditingController ccvController = TextEditingController();
  bool isCvvFocused = false;

  // setCtrlLength(int l) {
  //   controllers = [];
  //   for (int i = 1; i <= l; i++) {
  //     controllers.add(TextEditingController());
  //   }
  // }

  final Map<String, dynamic> paymentData = <String, dynamic>{};

  addPayment() async {
    try {
      emit(const AddCardState.loading());
      setPaymentMethodMap();
      debugPrint('================= $paymentData');
      final result = await PayemntRepoImpl.i.addVisa(paymentData);
      result.fold(
        (l) {
          debugPrint('================= add Payment  Failes :$l ');
          emit(AddCardState.error(error: KFailure.toError(l)));
        },
        (r) {
          addPaymentModel = r;

          debugPrint('================= add Payment  Success :${r.toJson()} ');
          emit(AddCardState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= add Payment  catch $e  ');
      emit(AddCardState.error(error: Tr.get.something_went_wrong));
    }
  }

  List<String> get values => [
        cardNumberController.text.removeAllWhitespace,
        nameController.text,
      ];

  List keyMap = ["number", "name"];

  setPaymentMethodMap() {
    paymentData.clear();

    paymentData.addAll({"type_id": 2, "keys[]": keyMap, "values[]": values, "is_visible": isVisible ? 1 : 0});
  }

  bool isVisible = true;

  toggleVisibility(bool val) {
    isVisible = val;
    _update;
  }

  // selectType(PaymentTypeData? selected) {
  //   selectedPayTypeData = selected;
  //   setCtrlLength(selectedPayTypeData?.keys?.length ?? 0);
  //   _update;
  // }
  get onCreditCardModelChange {
    // cardNumberController.text = creditCardModel!.cardNumber;
    // // expireController.text = creditCardModel.expiryDate;
    // nameController.text = creditCardModel.cardHolderName;
    // // ccvController.text = creditCardModel.cvvCode;
    // isCvvFocused = creditCardModel.isCvvFocused;
    _update;
  }

  get _update {
    emit(const AddCardState.loading());
    emit(const AddCardState.initial());
  }
}
