import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../../packages/shared/error/failures.dart';
import 'add_famous_attrs_state.dart';

class AddFamousAttrsBloc extends Cubit<AddFamousAttrsState> {
  AddFamousAttrsBloc({required this.addFamousAttrsRepoImp}) : super(const AddFamousAttrsState.initial());

  static AddFamousAttrsBloc of(BuildContext context) => BlocProvider.of<AddFamousAttrsBloc>(context);

  final BranchStaffRepoImpl addFamousAttrsRepoImp;

  addFamous(Map<String, dynamic> values) async {
    try {
      emit(const AddFamousAttrsState.loading());
      final result = await addFamousAttrsRepoImp.addFamous(values);
      result.fold(
        (l) {
          debugPrint('================= AddFamousAttrs Bloc : ${KFailure.toError(l)}');
          emit(AddFamousAttrsState.error(error: l));
        },
        (r) {
          debugPrint('================= AddFamousAttrs Bloc : ${r.toString()}  ');
          emit(const AddFamousAttrsState.success());
        },
      );
    } catch (e) {
      debugPrint('================= AddFamousAttrs Bloc (Catch): ${e.toString()} ');
      emit(const AddFamousAttrsState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
