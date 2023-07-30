import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/models/branch_staff/branch_staff_model.dart';
import '../../../packages/modules/models/company/company_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/widgets/search_manager.dart';
import '../managers_list_tile.dart';
import '../../../packages/widgets/custom_button.dart';

class EmployeesListView extends StatelessWidget {
  final BranchStaffData staffData;
  final String? title;
  final int? employeeId;

  const EmployeesListView({Key? key, required this.staffData, this.title, this.employeeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (staffData.employees ?? []).isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(Tr.get.no_employees_yet),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset("assets/images/No Requests.svg"),
              ],
            ),
          )
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
            separatorBuilder: (_, index) => const Divider(),
            itemCount: (staffData.employees!.length <= 4) ? staffData.employees!.length : 4,
            itemBuilder: (_, index) {
              final employees = staffData.employees ?? [];
              if (index == 3) {
                return KButton(
                  title: Tr.get.show_more,
                  onPressed: () {
                    KHelper.showCustomBottomSheetWTIntrinsic(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchableView<CompanyOwner>(
                          initialList: employees,
                          where: (item) => item.name,
                          whereList: (item) => [],
                          builder: (employees, isSearching) => ListView.builder(
                            itemCount: employees.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ManagersListTile(
                                  data: employees[i],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return ManagersListTile(
                  data: staffData.employees![index],
                );
              }
            },
          );
  }
}
