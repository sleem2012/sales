import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/branch_staff/branch_staff_model.dart' hide Image;
import '../../di.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_states.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../famous/famous_tabs.dart';
import '../locked_comapny/locked_comapny_landing.dart';
import '../pending_applications/pending_landing.dart';
import '../sales_delegate/vendor_state/vendors_landing.dart';
import 'widget/sub_widget.dart';
import '../widgets/appbar.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import 'package:get/get.dart';

import '../home_screen/widgets/data_tile.dart';
import '../home_screen/widgets/employees_list_view.dart';

class SubordinateScreen extends StatefulWidget {
  const SubordinateScreen({
    Key? key,
    required this.employees,
    required this.isSales,
  }) : super(key: key);
  final CompanyOwner employees;
  final bool isSales;

  @override
  State<SubordinateScreen> createState() => _SubordinateScreenState();
}

class _SubordinateScreenState extends State<SubordinateScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: BgImg(
        child: BlocProvider(
          create: (context) => Di.branchStaffBloc..getStaffById(id: widget.employees.id!),
          child: BlocBuilder<BranchStaffBloc, BranchStaffState>(
            builder: (context, state) {
              return state.when(
                loading: () => const KLoadingOverlay(isLoading: true),
                success: (model) {
                  final bloc = BranchStaffBloc.of(context);
                  return RefreshIndicator(
                    onRefresh: () async {
                      await BranchStaffBloc.of(context).getStaffById(id: widget.employees.id!);
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: Get.height,
                        child: DefaultTabController(
                          length: bloc.getTabLength(employees: widget.employees),
                          child: Column(
                            children: [
                              SubWidget(employees: widget.employees),
                              const SizedBox(height: 30),
                              Column(
                                children: [
                                  DataTile(
                                    title: Tr.get.total_Contracts,
                                    Data: '${model.satffData?.totalAchievedContracts ?? 0}',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DataTile(
                                    title: Tr.get.achieved_contracts,
                                    Data: '${model.satffData?.achievedContracts ?? 0}',
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // TopAchieversListView(satffData: model.satffData!),
                              if (BranchStaffBloc.of(context).getTabLength(employees: widget.employees) > 0) ...[
                                ColoredBox(
                                  color: KColors.of(context).fillContainer,
                                  child: TabBar(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    isScrollable: true,
                                    tabs: [
                                      if (widget.employees.type?.actionCollection?.users?.view == true)
                                        FittedBox(
                                          child: Text(
                                            "${model.satffData?.employeeTypes?.value.toString().capitalize}",
                                            style: KTextStyle.of(context).tapBar,
                                          ),
                                        ),
                                      if (widget.employees.type?.actionCollection?.vendors?.view == true)
                                        FittedBox(child: Text(Tr.get.vendors, style: KTextStyle.of(context).tapBar)),
                                      if (widget.employees.type?.actionCollection?.agencies?.view == true)
                                        FittedBox(child: Text(Tr.get.agency, style: KTextStyle.of(context).tapBar)),
                                      if (widget.employees.type?.actionCollection?.internalEmployee?.view == true)
                                        FittedBox(child: Text(Tr.get.pending_employes, style: KTextStyle.of(context).tapBar)),
                                      if (widget.employees.type?.actionCollection?.locked_company?.view == true)
                                        FittedBox(child: Text(Tr.get.locked_vendors, style: KTextStyle.of(context).tapBar)),
                                      if (widget.employees.type?.actionCollection?.famous?.view == true)
                                        FittedBox(child: Text(Tr.get.famous, style: KTextStyle.of(context).tapBar)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      if (widget.employees.type?.actionCollection?.users?.view == true)
                                        EmployeesListView(
                                          staffData: model.satffData!,
                                          title: model.satffData?.employeeTypes?.value.toString(),
                                          employeeId: widget.employees.id!,
                                        ),
                                      if (widget.employees.type?.actionCollection?.vendors?.view == true)
                                        VendorsLanding(vendors: model.satffData?.vendors ?? [], canUpdate: false, employeeId: widget.employees.id!),
                                      if (widget.employees.type?.actionCollection?.agencies?.view == true)
                                        VendorsLanding(vendors: model.satffData?.agents ?? [], canUpdate: false, employeeId: widget.employees.id!),
                                      if (widget.employees.type?.actionCollection?.internalEmployee?.view == true)
                                        PendingApplicationsLanding(
                                          pendingApplications:
                                              model.satffData?.internalEmployee?.where((element) => element.state == "pending").toList() ?? [],
                                          canUpdate: false,
                                          managedEmployees: model.satffData ?? BranchStaffData(),
                                        ),
                                      if (widget.employees.type?.actionCollection?.locked_company?.view == true)
                                        LockedCompanyLanding(
                                          canUpdate: false,
                                          managedEmployees: model.satffData ?? BranchStaffData(),
                                          employeeId: widget.employees.id!,
                                        ),
                                      if (widget.employees.type?.actionCollection?.famous?.view == true)
                                        FamousTabs(
                                          famousData: model.satffData?.famousEmployee ?? [],
                                        ),
                                    ],
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                error: (e) => KErrorWidget(
                  error: e,
                  isError: true,
                  onTryAgain: () => BranchStaffBloc.of(context).getStaffById(id: widget.employees.id!),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
