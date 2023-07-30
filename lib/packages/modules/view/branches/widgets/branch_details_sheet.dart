import 'package:flutter/material.dart';

import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../../users_permissions.dart';
import '../../../logic/branches/get_branches/branches_bloc.dart';
import '../../../models/branches/branch_model.dart';
import 'add_new_branch.dart';

class BranchDetails extends StatelessWidget {
  const BranchDetails({Key? key, required this.branchData}) : super(key: key);
  final BranchData branchData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 60,
            decoration: KHelper.of(context).filled,
          ),
          const SizedBox(height: 20),
          Text('${branchData.addressId?.detailedAddress}', style: KTextStyle.of(context).names),
          const SizedBox(height: 10),
          Text('${branchData.addressId?.floor}', style: KTextStyle.of(context).body),
          const SizedBox(height: 10),
          Text('${branchData.addressId?.zipcode}', style: KTextStyle.of(context).body),
          const SizedBox(height: 10),
          // Text(
          //   'See On Google Maps',
          //   style: KTextStyle.of(context).names,
          // ),
          const SizedBox(height: 20),

          if (UsersPermissions.canAddEditBranch)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: KButton(
                    title: Tr.get.edit_branch,
                    onPressed: () {
                      Nav.replace(AddNewBranchDialog(branchData: branchData));
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Text(Tr.get.delete_branch, style: KTextStyle.of(context).error),
                    onPressed: () {
                      BranchesBloc.of(context).deleteBranches(branchData.id!);
                      Nav.back();
                    },
                  ),
                ),
              ],
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
