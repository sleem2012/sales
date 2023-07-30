import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../data/models/branch_staff/branch_staff_model.dart';
import '../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../packages/modules/models/company/company_model.dart';
import 'branch_staff_states.dart';

class BranchStaffBloc extends Cubit<BranchStaffState> {
  BranchStaffBloc({required this.branchStaffRepoImpl}) : super(const BranchStaffState.loading());

  static BranchStaffBloc of(BuildContext context) {
    return BlocProvider.of<BranchStaffBloc>(context);
  }

  final BranchStaffRepoImpl branchStaffRepoImpl;
  BranchStaffModel? branchStaffModel;

  int getTabLength({required CompanyOwner employees}) {
    int length = employees.type?.actionCollection?.length == null
        ? (employees.type?.actionCollection?.toJson().values.where((element) => element?['view'] == true).toList().length ?? 0)
        : (employees.type?.actionCollection?.length ?? 0);
    return length;
  }

  Future getStaff() async {
    emit(const BranchStaffState.loading());

    try {
      final result = await branchStaffRepoImpl.getBranchStaff();
      result.fold((l) => emit(BranchStaffState.error(error: KFailure.toError(l))), (r) {
        branchStaffModel = r;
        emit(BranchStaffState.success(branchStaffModel: r));
      });
    } catch (e) {
      debugPrint('================= Get Branch Staff (Bloc) (catch) : $e  ');
      emit(BranchStaffState.error(error: e.toString()));
      rethrow;
    }
  }

  Future getStaffById({required int id}) async {
    emit(const BranchStaffState.loading());

    try {
      final result = await branchStaffRepoImpl.getBranchStaff(id: id);
      result.fold((l) => emit(BranchStaffState.error(error: KFailure.toError(l))), (r) {
        branchStaffModel = r;
        emit(BranchStaffState.success(branchStaffModel: r));
      });
    } catch (e) {
      debugPrint('================= Get Branch Staff by id (Bloc) (catch) : $e  ');
      emit(BranchStaffState.error(error: e.toString()));
    }
  }
}
