import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../views/widgets/appbar.dart';
import '../../../../views/widgets/error/error_widget.dart';
import '../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../views/widgets/new_bg_img.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../users_permissions.dart';
import '../../../widgets/custom_button.dart';
import '../../logic/branches/get_branches/branches_bloc.dart';
import '../../logic/branches/get_branches/branches_state.dart';
import 'widgets/add_new_branch.dart';
import 'widgets/branch_list_tile.dart';

class BranchesList extends StatelessWidget {
  const BranchesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(needsPop: true, title: Tr.get.branches),
      extendBodyBehindAppBar: true,
      body: BgImg(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => BranchesBloc.of(context).getBranches(),
                child: BlocBuilder<BranchesBloc, BranchesState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const KLoadingOverlay(isLoading: true),
                      loading: () => const KLoadingOverlay(isLoading: true),
                      success: (model) {
                        return Column(
                          children: [
                            Expanded(
                              child: (model.branchData?.isEmpty ?? true)
                                  ? Center(child: Text(Tr.get.dont_have_branches))
                                  : ListView.separated(
                                      itemCount: model.branchData?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return BranchListTile(branchData: model.branchData![index]);
                                      },
                                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                                    ),
                            ),
                            if (UsersPermissions.checkApp(model.branchData!.isEmpty))
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: KHelper.width * .15).copyWith(bottom: 20),
                                child: KButton(
                                  title: Tr.get.add_new_branch,
                                  width: KHelper.width * 6,
                                  onPressed: () {
                                    // Nav.of(context).offAll(const AddNewBranchDialog());
                                    KHelper.showCustomBottomSheet(const AddNewBranchDialog());
                                  },
                                ),
                              ),
                          ],
                        );
                      },
                      error: (error) => KErrorWidget(
                        error: error,
                        isError: true,
                        onTryAgain: BranchesBloc.of(context).getBranches,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
