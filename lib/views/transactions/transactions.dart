import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/commission/commission_model.dart';
import '../../di.dart';
import '../../logic/commission/commission_bloc.dart';
import '../../logic/commission/commission_state.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/localization/trans.dart';
import '../home_screen/widgets/data_tile.dart';
import 'widgets/key_value_text.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

import '../../packages/shared/theme/text_theme.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.commissionBloc..getCommission(),
      child: BlocBuilder<CommissionBloc, CommissionState>(
        builder: (context, state) {
          return state.when(
            initial: () => const KLoadingOverlay(isLoading: true),
            loading: () => const KLoadingOverlay(isLoading: true),
            success: (model) => KLoadingOverlay(
              child: RefreshIndicator(
                onRefresh: () async {
                  await CommissionBloc.of(context).getCommission();
                },
                child: (KStorage.i.getUserInfo?.data?.type?.actionCollection?.commissions?.view == true)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(Tr.get.payment, style: KTextStyle.of(context).title),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DataTile(title: '${Tr.get.pending} ( ${model.general?.pending?.count} )', Data: '${model.general?.pending?.amount}'),
                              const SizedBox(
                                height: 10,
                              ),
                              DataTile(title: '${Tr.get.completed} ( ${model.general?.completed?.count} )', Data: '${model.general?.completed?.amount}'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(Tr.get.commission_history, style: KTextStyle.of(context).title),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: Get.height * .1),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                separatorBuilder: (BuildContext c, i) {
                                  return Container(
                                    height: 5,
                                  );
                                },
                                itemCount: model.data?.length ?? 0,
                                itemBuilder: (BuildContext context, index) {
                                  return KeyValueText(
                                    commision: model.data?[index] ?? CommisoinData(),
                                    //   commision:   CommisoinData(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(child: Text(Tr.get.no_commission)),
              ),
            ),
            error: (error) => KErrorWidget(
              error: error,
              isError: true,
              onTryAgain: CommissionBloc.of(context).getCommission,
            ),
          );
        },
      ),
    );
  }
}
