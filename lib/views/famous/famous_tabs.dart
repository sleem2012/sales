import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/famous/famous_data.dart';
import '../../logic/famous/famous_types/famous_types_bloc.dart';
import '../../logic/famous/famous_types/famous_types_state.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

import 'famous_landing.dart';

class FamousTabs extends StatefulWidget {
  const FamousTabs({Key? key, required this.famousData}) : super(key: key);
  final List<FamousEmployee> famousData;

  @override
  State<FamousTabs> createState() => _FamousTabsState();
}

class _FamousTabsState extends State<FamousTabs> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamousTypesBloc, FamousTypesState>(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.height / 50,
                      vertical: 15,
                    ),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: [
                      ...model.data
                              ?.map(
                                (e) => FittedBox(
                                  child: Text(
                                    e.name?.value.toString().capitalize ?? '',
                                    style: KTextStyle.of(context).tapBar,
                                  ),
                                ),
                              )
                              .toList() ??
                          []
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ...model.data
                                ?.map((e) => FamousLanding(famousData: widget.famousData.where((element) => element.type?.id == e.id).toList()))
                                .toList() ??
                            []
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error) => KErrorWidget(
            error: error,
            onTryAgain: FamousTypesBloc.of(context).getFamousTypes,
          ),
        );
      },
    );
  }
}
