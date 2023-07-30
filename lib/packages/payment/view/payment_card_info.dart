import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../views/widgets/action_dialog.dart';
import '../../../views/widgets/error/error_widget.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/slide_panel.dart';
import '../logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../logic/get_my_payment_bloc/get_my_payment_state.dart';
import 'add_card_payment.dart';

class PaymentCardInformation extends StatefulWidget {
  const PaymentCardInformation({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  State<PaymentCardInformation> createState() => _PaymentCardInformationState();
}

class _PaymentCardInformationState extends State<PaymentCardInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<MyPaymentsBloc, MyPaymentsState>(
            builder: (context, state) {
              return state.when(
                loading: () => const KLoadingOverlay(isLoading: true),
                error: (error) => KErrorWidget(
                  error: error,
                  isError: true,
                  onTryAgain: MyPaymentsBloc.of(context).getMyPayments,
                ),
                success: (model) {
                  final list = MyPaymentsBloc.of(context).getFilteredList(widget.id!);
                  debugPrint(list.length.toString());
                  return Column(
                    children: [
                      Expanded(
                        child: list.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/images/pay_card.svg'),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(Tr.get.you_dont_have_any_card_yet_please_add_one),
                                  ],
                                ),
                              )
                            : ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const Divider(height: 10, thickness: 2);
                                },
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return Slidable(
                                    key: Key(list[index].id.toString()),
                                    dragStartBehavior: DragStartBehavior.start,
                                    endActionPane: actionPane(
                                      isToENd: false,
                                      Icons.delete,
                                      Colors.red,
                                      () {
                                        ActionDialog(
                                          title: Tr.get.do_you_wanna_delete,
                                          approveAction: Tr.get.yes_message,
                                          cancelAction: Tr.get.no_message,
                                          onApproveClick: () {
                                            MyPaymentsBloc.of(context).delete(list[index]);

                                            Nav.back();
                                          },
                                          onCancelClick: () {
                                            Nav.back();
                                          },
                                        ).show<void>(context);
                                      },
                                    ),
                                    child: CreditCardWidget(
                                      cardNumber: list[index].values!.firstWhere((e) => e.key == "number").value ?? '',
                                      expiryDate: "",
                                      cardHolderName: list[index].values!.firstWhere((element) => element.key == "name").value.toString(),
                                      cvvCode: "",
                                      // bankName: 'Axis Bank',
                                      showBackView: false,
                                      obscureCardNumber: true,
                                      obscureCardCvv: false,
                                      isHolderNameVisible: true,
                                      cardBgColor: KColors.of(context).card,
                                      isSwipeGestureEnabled: false,
                                      padding: 10,
                                      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                                      customCardTypeIcons: <CustomCardTypeIcon>[
                                        CustomCardTypeIcon(
                                          cardType: CardType.mastercard,
                                          cardImage: Image.asset('assets/images/mastercard.png', height: 48, width: 48),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                addAutomaticKeepAlives: true,
                                padding: EdgeInsets.zero,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: KButton(
                          title: Tr.get.add,
                          onPressed: () {
                            Nav.to(
                              AddCardPaymentView(
                                onSuccess: () {
                                  Nav.back();
                                  // Nav.replace(OnSuccessView(msg: Tr.get.payment_added_successfully, doubleBack: true));
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
