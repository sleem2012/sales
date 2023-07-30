import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../data/models/branch_staff/branch_staff_model.dart';
import '../../data/models/dashboard/pending_applications_model.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import 'pending_apllications_tile.dart';

class PendingApplicationsLanding extends StatefulWidget {
  final List<PendingApplicationsData> pendingApplications;
  final BranchStaffData managedEmployees;
  final bool canUpdate;
  final int? employeeId;

  const PendingApplicationsLanding({Key? key, required this.pendingApplications, required this.managedEmployees, required this.canUpdate, this.employeeId}) : super(key: key);

  @override
  State<PendingApplicationsLanding> createState() => _PendingApplicationsLandingState();
}

class _PendingApplicationsLandingState extends State<PendingApplicationsLanding> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (widget.pendingApplications.isEmpty)
              ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Tr.get.no_request_yet),
                        const SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset("assets/images/No Requests.svg"),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 100),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (widget.pendingApplications.length <= 3) ? widget.pendingApplications.length : 3,
                  primary: false,
                  itemBuilder: (context, index) {
                    final filterdList = widget.pendingApplications;
                    if (index == 2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: KButton(
                          title: Tr.get.show_more,
                          onPressed: () {
                            KHelper.showCustomBottomSheetWTIntrinsic(
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SearchableList<PendingApplicationsData>(
                                  displayClearIcon: true,
                                  builder: (PendingApplicationsData employees) => PendingApplicationsTile(
                                    data: employees,
                                    canUpdate: widget.canUpdate,
                                    branchSttafData: widget.managedEmployees,
                                  ),
                                  asyncListCallback: () async {
                                    await Future.delayed(
                                      const Duration(
                                        milliseconds: 10,
                                      ),
                                    );
                                    return filterdList.toList();
                                  },
                                  asyncListFilter: (q, list) {
                                    return list.where((element) => element.user!.email!.contains(q)).toList();
                                  },
                                  inputDecoration: InputDecoration(
                                    hintText: Tr.get.search,
                                    hintStyle: KTextStyle.of(context).hint,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                    errorStyle: KTextStyle.of(context).error,
                                    isDense: false,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return PendingApplicationsTile(
                        data: filterdList.elementAt(index),
                        canUpdate: widget.canUpdate,
                        branchSttafData: widget.managedEmployees,
                      );
                    }
                  },
                ),
        )
      ],
    );
  }
}
