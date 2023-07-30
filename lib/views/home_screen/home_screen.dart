import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/models/branch_staff/branch_staff_model.dart';
import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_states.dart';
import '../../logic/famous/famous_types/famous_types_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/modules/models/user_info/user_model.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import '../famous/famous_tabs.dart';
import '../locked_comapny/locked_comapny_landing.dart';
import '../pending_applications/pending_landing.dart';
import '../sales_delegate/vendor_state/vendors_landing.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import 'widgets/data_tile.dart';
import 'widgets/employees_list_view.dart';
import 'widgets/top_achivers_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actionCollection = KStorage.i.getUserInfo?.data?.type?.actionCollection ?? ActionCollection();
    return DefaultTabController(
      length: actionCollection.length ?? 0,
      child: BlocBuilder<BranchStaffBloc, BranchStaffState>(
        builder: (context, state) {
          return state.when(
            loading: () => const KLoadingOverlay(isLoading: true),
            success: (model) {
              return RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () async {
                  await UserInfoBloc.of(context).getUserInfo().whenComplete(() {
                    BranchStaffBloc.of(context).getStaff();
                    FamousTypesBloc.of(context).getFamousTypes();
                  });
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              DataTile(title: Tr.get.total_Contracts, Data: '${model.satffData?.totalAchievedContracts ?? 0}'),
                              const SizedBox(
                                height: 10,
                              ),
                              DataTile(title: Tr.get.achieved_contracts, Data: '${model.satffData?.achievedContracts ?? 0}'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (actionCollection.users?.view == true) TopAchieversListView(staffData: model.satffData ?? BranchStaffData()),
                          if (KStorage.i.getUserInfo?.data?.type?.id == 16)
                            KButton(
                              width: Get.width * .2,
                              onPressed: () async {
                                await Share.share(
                                  KStorage.i.getFamous.toString(),
                                );
                                // copied successfully
                              },
                              title: KStorage.i.getFamous.toString(),
                            ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ColoredBox(
                            color: KColors.of(context).fillContainer,
                            child: TabBar(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              tabs: [
                                if (actionCollection.users?.view == true)
                                  FittedBox(
                                    child: Text("${model.satffData?.employeeTypes?.value.toString().capitalize}", style: KTextStyle.of(context).tapBar),
                                  ),
                                if (actionCollection.vendors?.view == true) FittedBox(child: Text(Tr.get.vendors, style: KTextStyle.of(context).tapBar)),
                                if (actionCollection.agencies?.view == true) FittedBox(child: Text(Tr.get.agency, style: KTextStyle.of(context).tapBar)),
                                if (actionCollection.internalEmployee?.view == true) FittedBox(child: Text(Tr.get.pending_employes, style: KTextStyle.of(context).tapBar)),
                                if (actionCollection.locked_company?.view == true) FittedBox(child: Text(Tr.get.locked_vendors, style: KTextStyle.of(context).tapBar)),
                                if (actionCollection.famous?.view == true) FittedBox(child: Text(Tr.get.famous, style: KTextStyle.of(context).tapBar)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                if (actionCollection.users?.view == true) EmployeesListView(staffData: model.satffData!, title: model.satffData?.employeeTypes?.value.toString()),
                                if (actionCollection.vendors?.view == true) VendorsLanding(vendors: model.satffData?.vendors ?? [], canUpdate: true),
                                if (actionCollection.agencies?.view == true) VendorsLanding(vendors: model.satffData?.agents ?? [], canUpdate: true),
                                if (actionCollection.internalEmployee?.view == true)
                                  PendingApplicationsLanding(
                                    pendingApplications: model.satffData?.internalEmployee?.where((element) => element.state == "pending").toList() ?? [],
                                    canUpdate: true,
                                    managedEmployees: model.satffData ?? BranchStaffData(),
                                  ),
                                if (actionCollection.locked_company?.view == true) LockedCompanyLanding(canUpdate: true, managedEmployees: model.satffData ?? BranchStaffData()),
                                if (actionCollection.famous?.view == true) FamousTabs(famousData: model.satffData?.famousEmployee ?? []),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error) => KErrorWidget(
              error: error,
              isError: true,
              onTryAgain: BranchStaffBloc.of(context).getStaff,
            ),
          );
        },
      ),
    );
  }
}
