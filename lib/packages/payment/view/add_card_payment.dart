import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

import '../../../di.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../views/widgets/appbar.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/new_bg_img.dart';
import '../../../views/widgets/on_error_view.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/text_field.dart';
import '../../widgets/web_view.dart';
import '../data/payment/my_payment_model.dart';
import '../logic/add_card_bloc/add_card_state.dart';
import '../logic/add_card_bloc/add_payment_card_bloc.dart';
import '../logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../logic/get_my_payment_bloc/get_my_payment_state.dart';

class AddCardPaymentView extends StatelessWidget {
  const AddCardPaymentView({Key? key, required this.onSuccess}) : super(key: key);
  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const KAppBar(needsPop: true, title: '', showAct: false),
      extendBodyBehindAppBar: true,
      body: BgImg(
        child: Padding(
          padding: const EdgeInsets.only(top: 95.0),
          child: BlocProvider(
            create: (context) => Di.addCardBloc,
            child: BlocConsumer<AddCardBloc, AddCardState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (model) async {
                    String url = "${model.data?.url}";
                    final payBloc = MyPaymentsBloc.of(context);

                    debugPrint("url  $url");
                    await Nav.to(
                      KWebView(
                        url: url,
                        onSuccess: onSuccess,
                        onFail: () {
                          Nav.replace(OnErrorView(msg: Tr.get.card_error, doubleBack: true));
                        },
                      ),
                    );
                    payBloc.getMyPayments();
                  },
                );
              },
              builder: (context, state) {
                final addPayment = AddCardBloc.of(context);
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      CreditCardWidget(
                        cardNumber: addPayment.cardNumberController.text,
                        expiryDate: '',
                        cardHolderName: addPayment.nameController.text,
                        cvvCode: '',
                        // bankName: 'Axis Bank',
                        showBackView: addPayment.isCvvFocused,
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        isHolderNameVisible: true,
                        cardBgColor: KColors.of(context).card,
                        isSwipeGestureEnabled: true,
                        onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},

                        customCardTypeIcons: <CustomCardTypeIcon>[
                          CustomCardTypeIcon(
                            cardType: CardType.mastercard,
                            cardImage: Image.asset(
                              'assets/images/mastercard.png',
                              height: 48,
                              width: 48,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                KTextFormField(
                                  hintText: Tr.get.id_number,
                                  keyboardType: TextInputType.number,
                                  controller: addPayment.cardNumberController,
                                  formatter: [
                                    LengthLimitingTextInputFormatter(16),
                                  ],
                                  onChanged: (v) {
                                    addPayment.onCreditCardModelChange;
                                  },
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                KTextFormField(
                                  hintText: Tr.get.name,
                                  keyboardType: TextInputType.name,
                                  controller: addPayment.nameController,
                                  onChanged: (v) {
                                    addPayment.onCreditCardModelChange;
                                  },
                                ),
                                const SizedBox(height: 30),
                                KButton(
                                  width: Get.width * .7,
                                  title: Tr.get.save,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      addPayment.addPayment();
                                    } else {
                                      // debugPrint(addPayment.nameController.text);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentDropDown extends StatelessWidget {
  const PaymentDropDown({Key? key, required this.onChanged}) : super(key: key);
  final Function(PaymentData?) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPaymentsBloc, MyPaymentsState>(
      builder: (context, state) {
        final paymentList = state.maybeWhen(
          orElse: () => <PaymentData>[],
          success: (model) {
            return model.data!.where((element) => element.state == "valid" && element.type_id == 2);
          },
        );
        if (paymentList.isNotEmpty) {
          return KDropdownBtn<PaymentData>(
            title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_payment_card,
            items: paymentList.map(
              (e) {
                return KHelper.of(context).itemView(
                  itemText: "${e.values?.firstWhere((element) => element.key!.contains('number')).value}",
                  value: e,
                );
              },
            ).toList(),
            onChanged: onChanged,
            validator: (p0) {
              if (p0 == null) {
                return Tr.get.field_required;
              } else {
                return null;
              }
            },
          );
        } else {
          return KButton(
            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
            onPressed: () {
              Get.to(
                () => AddCardPaymentView(
                  onSuccess: () {
                    Nav.back();
                  },
                ),
              );
            },
            title: Tr.get.no_card,
          );
        }
      },
    );
  }
}
