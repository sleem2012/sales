import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../../packages/shared/error/failures.dart';
import 'internal_employee_state.dart';

class InternalEmployeeCubit extends Cubit<InternalEmployeeState> {
  InternalEmployeeCubit({required this.internalViewImpl}) : super(const InternalEmployeeState.initial());

  static InternalEmployeeCubit of(context) => BlocProvider.of(context);

  final BranchStaffRepoImpl internalViewImpl;

  addInternal(Map<String, dynamic> values) async {
    try {
      final sorted = values.entries.toList()..sort((a, b) => (int.tryParse(a.key) ?? 0).compareTo((int.tryParse(b.key) ?? 0)));
      Map<String, dynamic> attrs = {};
      for (var element in sorted) {
        var x = {"answer_collections[${element.key}]": element.value};
        attrs.addAll(x);
      }

      emit(const InternalEmployeeState.loading());
      final result = await internalViewImpl.addInternalEmployee(attrs);
      result.fold(
        (l) {
          debugPrint('================= InternalEmployee  Failed :$l ');
          emit(InternalEmployeeState.error(error: l));
        },
        (r) {
          debugPrint('================= InternalEmployee  Success :$r ');
          emit(const InternalEmployeeState.success());
        },
      );
    } catch (e) {
      debugPrint('=================InternalEmployee  catch $e  ');
      emit(const InternalEmployeeState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
