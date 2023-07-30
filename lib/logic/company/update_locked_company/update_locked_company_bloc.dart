import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/modules/models/branches/branch_model.dart';
import '../../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../../data/repository/company/company_repo.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/logger.dart';

import '../../../../packages/shared/error/failures.dart';
import 'update_locked_company_state.dart';

class UpdateLockedCompanyBloc extends Cubit<UpdateLockedCompanyState> {
  UpdateLockedCompanyBloc({required this.companyRepoImpl}) : super(const UpdateLockedCompanyState.initial());

  static UpdateLockedCompanyBloc of(BuildContext context) {
    return BlocProvider.of<UpdateLockedCompanyBloc>(context);
  }

  final CompanyRepoImpl companyRepoImpl;

  update({required int id}) async {
    if (applicationState == null) {
      KHelper.showSnackBar(Tr.get.select_state);
      return;
    }
    try {
      emit(const UpdateLockedCompanyState.loading());

      final result = await companyRepoImpl.updateLockedCompany(values: setValues(id));
      printMap(setValues(id));
      result.fold(
        (l) {
          debugPrint('================= update Application KFailure $l   ');
          emit(UpdateLockedCompanyState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= update Application success   ');
          emit(const UpdateLockedCompanyState.success());
        },
      );
    } catch (e) {
      debugPrint('================= update Application Bloc ( Catch ) $e');
      emit(UpdateLockedCompanyState.error(error: Tr.get.something_went_wrong));
    }
  }

  int? assignerId;
  BranchData? selectedBranch;

  selectBranchId(BranchData? selected) {
    selectedBranch = selected;

    _update;
  }

  String? applicationState;

  selectState(String? selected) {
    applicationState = selected;

    _update;
  }

  Map<String, dynamic> setValues(int CompanyId) {
    if (applicationState == KUpdateCompanyState.state[0]) {
      return {"id": CompanyId, "lock": 0};
    } else {
      return {
        "id": CompanyId,
        "sales_id": assignerId,
      };
    }
  }

  get _update {
    emit(const UpdateLockedCompanyState.loading());
    emit(const UpdateLockedCompanyState.initial());
  }
}
