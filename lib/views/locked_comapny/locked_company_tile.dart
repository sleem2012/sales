import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/branch_staff/branch_staff_model.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/modules/models/company/company_model.dart' hide IconsSVG;
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/icon_button.dart';
import 'locked_company_details.dart';
import 'update_locked_company_application.dart';

class LockedCompanyTile extends StatelessWidget {
  final CompanyModel data;
  final bool canUpdate;
  final BranchStaffData branchSttafData;

  const LockedCompanyTile({Key? key, required this.data, required this.canUpdate, required this.branchSttafData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      width: Get.width,
      decoration: KHelper.of(context).elevatedBox,
      child: ListTile(
        onTap: () {
          Nav.to(CompanyDetails(data: data));
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text("${Tr.get.email}  :  ", style: KTextStyle.of(context).body),
            ),
            Expanded(child: Text(data.owner?.email ?? '', style: KTextStyle.of(context).body)),
          ],
        ),
        trailing: canUpdate
            ? KIconButton(
                child: const Icon(Icons.edit),
                onPressed: () {
                  KHelper.showCustomBottomSheet(
                    UpdateLockedCompanyView(
                      id: data.id!,
                      branchSttafData: branchSttafData,
                    ),
                  );
                },
              )
            : null,
      ),
    );
  }
}
