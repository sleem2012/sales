import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../../data/repository/dashboard/dashboard_repo.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/modules/models/branches/branch_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import 'update_application_state.dart';

class UpdateApplicationBloc extends Cubit<UpdateApplicationState> {
  UpdateApplicationBloc({required this.dashboardRepoImp}) : super(const UpdateApplicationState.initial());

  static UpdateApplicationBloc of(BuildContext context) {
    return BlocProvider.of<UpdateApplicationBloc>(context);
  }

  final DashboardRepoImp dashboardRepoImp;

  updateApplication({required int id}) async {
    if (applicationState == null) {
      KHelper.showSnackBar(Tr.get.select_state);
      return;
    }
    try {
      emit(const UpdateApplicationState.loading());

      final result = await dashboardRepoImp.updateApplication(values: setValues(id));

      result.fold(
        (l) {
          debugPrint('================= update Application KFailure $l   ');
          emit(UpdateApplicationState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= update Application success   ');
          emit(const UpdateApplicationState.success());
        },
      );
    } catch (e) {
      debugPrint('================= update Application Bloc ( Catch ) $e');
      emit(UpdateApplicationState.error(error: Tr.get.something_went_wrong));
    }
  }

  int? assignerId;
  BranchData? selectedBranch;

  selectBranchId(BranchData? selected) {
    selectedBranch = selected;

    _update;
  }

  KApplicationState? applicationState;

  selectState(KApplicationState? selected) {
    applicationState = selected;

    _update;
  }

  Map<String, dynamic> setValues(int applicationId) {
    if (applicationState == KApplicationState.applicationState[0]) {
      final admin_id = KStorage.i.getUserInfo?.data;
      return {
        "id": applicationId,
        "admin_id": admin_id?.id,
        "state": applicationState?.slug,
        if (admin_id?.type?.id == 1) "company_branch_id": selectedBranch?.id,
      };
    } else {
      return {
        "id": applicationId,
        "assigner_id": assignerId,
      };
    }
  }

  get _update {
    emit(const UpdateApplicationState.loading());
    emit(const UpdateApplicationState.initial());
  }
}
