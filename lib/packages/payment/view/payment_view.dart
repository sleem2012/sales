import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../packages/extensions.dart';
import '../../../views/widgets/appbar.dart';
import '../../../views/widgets/error/error_widget.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/new_bg_img.dart';
import '../../shared/theme/text_theme.dart';
import '../data/payment/payment_type_model.dart';
import '../logic/get_tyeps_bloc/get_payment_type_bloc.dart';
import '../logic/get_tyeps_bloc/get_payment_type_state.dart';
import 'payment_card_info.dart';
import 'payment_info.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: BgImg(
        child: BlocConsumer<GetPaymentTypeBloc, GetPaymentTypeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.when(
              initial: () => const KLoadingOverlay(isLoading: true),
              loading: () => const KLoadingOverlay(isLoading: true),
              success: (model) {
                return DefaultTabController(
                  length: (model.data ?? []).length,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.transparent,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                        labelStyle: KTextStyle.of(context).title.B,
                        labelColor: KTextStyle.of(context).title.color,
                        unselectedLabelStyle: KTextStyle.of(context).body,
                        unselectedLabelColor: KTextStyle.of(context).title.color,
                        tabs: PaymentViewModel.getTabs(model).map((e) => Text(e.name ?? '')).toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: PaymentViewModel.getTabs(model).map((e) => e.widgetView ?? const SizedBox()).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error) => KErrorWidget(error: error, onTryAgain: GetPaymentTypeBloc.of(context).gettypes),
            );
          },
        ),
      ),
    );
  }
}

class TabViewModel {
  String? name;
  Widget? widgetView;

  TabViewModel(this.name, this.widgetView);
}

class PaymentViewModel {
  static List<TabViewModel> getTabs(PaymentTypesModel model) {
    List<TabViewModel> tVM = [];
    (model.data ?? []).map((element) {
      return tVM.add(TabViewModel(element.name?.value, getView(element.id)));
    }).toList();

    return tVM;
  }

  static Widget getView(int? id) {
    switch (id) {
      case 1:
        return const PaymentInformation(
          id: 1,
        );
      case 2:
        return const PaymentCardInformation(
          id: 2,
        );
      default:
        return const SizedBox();
    }
  }
}
