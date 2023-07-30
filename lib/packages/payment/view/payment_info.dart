import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/payment/view/add_payment.dart';
import '../../../views/widgets/error/error_widget.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../extensions.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../../widgets/icon_button.dart';
import '../logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../logic/get_my_payment_bloc/get_my_payment_state.dart';

class PaymentInformation extends StatefulWidget {
  const PaymentInformation({Key? key, required this.id}) : super(key: key);
  final int? id;

  @override
  State<PaymentInformation> createState() => _PaymentInformationState();
}

class _PaymentInformationState extends State<PaymentInformation> {
  @override
  Widget build(BuildContext context) {
    final bool isAr = Directionality.of(context) == TextDirection.rtl;

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
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(10),
                          separatorBuilder: (context, index) {
                            return const Divider(height: 10, thickness: 2);
                          },
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: KHelper.of(context).elevatedBox,
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    children: list[index].values?.map(
                                          (e) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: KHelper.hPadding * 2,
                                                vertical: 2,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    e.hint?.value.toString().capitalized ?? '',
                                                    style: KTextStyle.of(context).names,
                                                  ),
                                                  Text(
                                                    e.value ?? '',
                                                    style: KTextStyle.of(context).body2,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ).toList() ??
                                        [const SizedBox()],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: !isAr ? 5 : null,
                                  left: isAr ? 20 : null,
                                  child: KIconButton(
                                    backgroundColor: KColors.of(context).accentColor,
                                    onPressed: () {
                                      Nav.to(AddPaymentView(
                                        data: list[index],
                                      ),);
                                    },
                                    radius: 35,
                                    child: const Icon(Icons.edit, color: Colors.white),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(25),
                      //   child: KButton(
                      //     title: Tr.get.add,
                      //     onPressed: () {
                      //       Nav.to(const AddPaymentView());
                      //     },
                      //   ),
                      // )
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
