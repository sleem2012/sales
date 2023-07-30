import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../../packages/shared/error/failures.dart';
import 'get_fields_state.dart';

class InternalEmpFieldsBloc extends Cubit<InternalEmpFieldsState> {
  InternalEmpFieldsBloc({required this.staffRepoImpl}) : super(const InternalEmpFieldsState.loading());
  static InternalEmpFieldsBloc of(BuildContext context) => BlocProvider.of<InternalEmpFieldsBloc>(context);
  final BranchStaffRepoImpl staffRepoImpl;

  get() async {
    try {
      emit(const InternalEmpFieldsState.loading());

      final result = await staffRepoImpl.get_internal_emp_fields();
      result.fold(
        (l) {
          debugPrint('================= InternalEmpFieldsBloc Bloc : ${KFailure.toError(l)}');
          emit(InternalEmpFieldsState.error(error: l));
        },
        (r) {
          debugPrint('================= InternalEmpFieldsBloc Bloc success ');
          emit(InternalEmpFieldsState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= InternalEmpFieldsBloc Bloc (Catch): ${e.toString()} ');
      emit(const InternalEmpFieldsState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
