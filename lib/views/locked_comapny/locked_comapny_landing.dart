import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/branch_staff/branch_staff_model.dart';
import '../../di.dart';
import '../../logic/company/get_company_type/get_company_bloc.dart';
import '../../logic/company/get_company_type/get_company_state.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/search_manager.dart';
import '../widgets/loading/loading_overlay.dart';
import 'locked_company_tile.dart';

class LockedCompanyLanding extends StatefulWidget {
  final BranchStaffData managedEmployees;
  final bool canUpdate;
  final int? employeeId;

  const LockedCompanyLanding({Key? key, required this.managedEmployees, required this.canUpdate, this.employeeId}) : super(key: key);

  @override
  State<LockedCompanyLanding> createState() => _LockedCompanyLandingState();
}

class _LockedCompanyLandingState extends State<LockedCompanyLanding> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.getCompanyBloc..getCompany(lock: 1, user_id: widget.employeeId),
      child: BlocBuilder<GetCompanyBloc, GetCompanyState>(
        builder: (context, state) {
          final company = GetCompanyBloc.of(context).companyModel ?? [];
          return KRequestOverlay(
            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
            onTryAgain: () => GetCompanyBloc.of(context).getCompany(lock: 1, user_id: widget.employeeId),
            error: state.whenOrNull(error: (error) => error),
            child: Column(
              children: [
                Expanded(
                  child: (company.isEmpty)
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
                          itemCount: (company.length <= 3) ? company.length : 3,
                          primary: false,
                          itemBuilder: (context, index) {
                            final filterdList = company;
                            if (index == 2) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: KButton(
                                  title: Tr.get.show_more,
                                  onPressed: () {
                                    KHelper.showCustomBottomSheetWTIntrinsic(
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SearchableView<CompanyModel>(
                                          initialList: filterdList,
                                          where: (item) => item.name?.value,
                                          whereList: (item) => [],
                                          builder: (list, isSearching) => ListView.builder(
                                            itemCount: list.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, i) {
                                              return LockedCompanyTile(
                                                data: list[i],
                                                canUpdate: widget.canUpdate,
                                                branchSttafData: widget.managedEmployees,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return LockedCompanyTile(
                                data: filterdList.elementAt(index),
                                canUpdate: widget.canUpdate,
                                branchSttafData: widget.managedEmployees,
                              );
                            }
                          },
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
