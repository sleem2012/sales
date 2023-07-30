import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/branch_staff/branch_staff_model.dart';
import '../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../di.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/dashboard/update_pending_application/update_application_bloc.dart';
import '../../logic/dashboard/update_pending_application/update_application_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/modules/logic/branches/get_branches/branches_bloc.dart';
import '../../packages/modules/logic/branches/get_branches/branches_state.dart';
import '../../packages/modules/models/branches/branch_model.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../packages/modules/view/branches/branches_list.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/drop_down.dart';

class UpdateApplicationView extends StatelessWidget {
  final int id;
  final BranchStaffData branchSttafData;

  const UpdateApplicationView({Key? key, required this.id, required this.branchSttafData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.updateApplication,
      child: BlocConsumer<UpdateApplicationBloc, UpdateApplicationState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              BranchStaffBloc.of(context).getStaff();
              Nav.back();
            },
          );
        },
        builder: (context, state) {
          final update = UpdateApplicationBloc.of(context);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(KHelper.hPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                KDropdownBtn<KApplicationState>(
                  onChanged: update.selectState,
                  value: update.applicationState,
                  items: KApplicationState.applicationState.map((e) => KHelper.of(context).itemView<KApplicationState>(itemText: e.name, value: e)).toList(),
                  title: Tr.get.status,
                ),
                const SizedBox(
                  height: 8,
                ),
                if (update.applicationState == KApplicationState.applicationState[1])
                  KDropdownBtn<CompanyOwner>(
                    items: branchSttafData.employees?.map((e) => KHelper.of(context).itemView<CompanyOwner>(itemText: e.name ?? '', value: e)).toList() ?? [],
                    onChanged: (value) {
                      update.assignerId = value?.id;
                    },
                    title: Tr.get.select_Manager,
                  ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                if (KStorage.i.getUserInfo?.data?.type?.id == 1 && update.applicationState == KApplicationState.applicationState[0])
                  BlocConsumer<BranchesBloc, BranchesState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (model) {
                          if (model.branchData?.isEmpty ?? false) {
                            KHelper.showSnackBar("Create Branch");
                            Nav.to(const BranchesList());
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      final branchList = state.maybeWhen(
                        orElse: () => <BranchData>[],
                        success: (model) => model.branchData!,
                      );
                      return Column(
                        children: [
                          if (branchList.isEmpty)
                            TextButton(
                              child: Text(
                                Tr.get.dont_have_branches,
                                style: KTextStyle.of(context).textBtn,
                              ),
                              onPressed: () {
                                Nav.to(const BranchesList());
                              },
                            )
                          else
                            KDropdownBtn<BranchData>(
                              onChanged: (val) {
                                update.selectBranchId(val);
                              },
                              items: branchList
                                  .map(
                                    (e) => KHelper.of(context).itemView<BranchData>(itemText: "${e.addressId?.detailedAddress}", value: e),
                                  )
                                  .toList(),
                              title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_branch,
                              value: update.selectedBranch,
                            ),
                          if (state.maybeWhen(orElse: () => false, error: (e) => true))
                            TextButton(
                              onPressed: () {
                                BranchesBloc.of(context).getBranches();
                              },
                              child: Text(Tr.get.try_again),
                            ),
                        ],
                      );
                    },
                  ),
                const SizedBox(
                  height: 10,
                ),
                KButton(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  title: Tr.get.submit,
                  width: Get.width * .8,
                  onPressed: () {
                    UpdateApplicationBloc.of(context).updateApplication(
                      id: id,
                    );
                    FocusManager.instance.primaryFocus?.unfocus();
                    return;
                  },
                  height: 45,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
