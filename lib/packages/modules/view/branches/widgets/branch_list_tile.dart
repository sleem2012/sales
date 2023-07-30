import 'package:flutter/material.dart';

import '../../../../../logic/auth/user_info/user_info_bloc.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/widgets/action_dialog.dart';
import '../../../../extensions.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../../widgets/icon_button.dart';
import '../../../logic/branches/get_branches/branches_bloc.dart';
import '../../../models/branches/branch_model.dart';
import 'add_new_branch.dart';

class BranchListTile extends StatelessWidget {
  const BranchListTile({Key? key, required this.branchData}) : super(key: key);
  final BranchData branchData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: KHelper.of(context).elevatedBox,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0).copyWith(bottom: 15),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('${branchData.addressId?.detailedAddress}', style: KTextStyle.of(context).body),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${Tr.get.floor} : ${branchData.addressId?.floor}', style: KTextStyle.of(context).body2),
                const SizedBox(height: 10),
                Text('${Tr.get.zipcode} : ${branchData.addressId?.zipcode}', style: KTextStyle.of(context).body2),
                const SizedBox(height: 10),
              ],
            ),
            onTap: () {
              //KHelper.showCustomBottomSheet(BranchDetails(branchData: branchData));
            },
          ),
        ),
        if (UserInfoBloc.of(context).user?.data?.userCompany != null)
          Positioned(
            bottom: 0,
            right: Tr.isAr ? null : 20,
            left: !Tr.isAr ? null : 20,
            child: Row(
              children: [
                KIconButton(
                  backgroundColor: KColors.accentColorD,
                  onPressed: () {
                    KHelper.showCustomBottomSheet(AddNewBranchDialog(branchData: branchData));
                  },
                  child: const Icon(Icons.edit, color: Colors.white, size: 18),
                ),
                20.w,
                KIconButton(
                  backgroundColor: KColors.accentColorD,
                  onPressed: () {
                    ActionDialog(
                      title: Tr.get.delete_branch,
                      approveAction: Tr.get.yes_message,
                      cancelAction: Tr.get.no_message,
                      onApproveClick: () {
                        Nav.back();
                        BranchesBloc.of(context).deleteBranches(branchData.id!);
                      },
                      onCancelClick: () {
                        Nav.back();
                      },
                    ).show<void>(context);
                  },
                  child: const Icon(Icons.delete, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
