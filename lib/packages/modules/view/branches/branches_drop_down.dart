import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../widgets/drop_down.dart';
import '../../logic/branches/get_branches/branches_bloc.dart';
import '../../logic/branches/get_branches/branches_state.dart';
import '../../models/branches/branch_model.dart';
import 'branches_list.dart';

class BranchesDropDown extends StatelessWidget {
  const BranchesDropDown({super.key, required this.onChanged, this.branchData});
  final BranchData? branchData;
  final Function(BranchData?) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BranchesBloc, BranchesState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (model) {
            if (model.branchData?.isEmpty ?? false) {
              KHelper.showSnackBar(Tr.get.create_branch_first);
              Nav.to(const BranchesList());
            }
          },
        );
      },
      builder: (context, state) {
        final branchList = state.maybeWhen(orElse: () => <BranchData>[], success: (model) => model.branchData!);
        return Column(
          children: [
            // if (branchList.isEmpty)
            //   KButton(
            //     title: Tr.get.dont_have_branches,
            //     onPressed: () => Nav.to(const BranchesList()),
            //   )
            // else
            KDropdownBtn<BranchData>(
              value: branchData,
              onChanged: (value) {
                debugPrint(branchData?.id.toString());
                onChanged(branchData ?? value);
              },
              isLoading: state.whenOrNull(loading: () => true) ?? false,
              items: branchList.map((e) => KHelper.of(context).itemView<BranchData>(itemText: "${e.addressId?.detailedAddress}", value: e)).toList(),
              title: state.maybeWhen(
                orElse: () => (branchData?.addressId?.detailedAddress != null ? branchData?.addressId?.detailedAddress ?? '' : Tr.get.select_language),
                loading: () => Tr.get.loading,
              ),
              validator: (p0) {
                if (p0 == null) {
                  Tr.get.field_required;
                }
                return null;
              },
            ),
            if (state.maybeWhen(orElse: () => false, error: (e) => true)) TextButton(onPressed: BranchesBloc.of(context).getBranches, child: Text(Tr.get.try_again)),
          ],
        );
      },
    );
  }
}
