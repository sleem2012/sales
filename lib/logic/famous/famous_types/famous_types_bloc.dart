import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/famous/famous_types.dart';
import '../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../../packages/shared/error/failures.dart';

import 'famous_types_state.dart';

class FamousTypesBloc extends Cubit<FamousTypesState> {
  FamousTypesBloc({required this.branchStaffRepoImpl}) : super(const FamousTypesState.initial());

  static FamousTypesBloc of(BuildContext context) {
    return BlocProvider.of<FamousTypesBloc>(context);
  }

  final BranchStaffRepoImpl branchStaffRepoImpl;

  FamousTypes? famousTypes;

  getFamousTypes() async {
    try {
      final result = await branchStaffRepoImpl.getFamousTypes();
      result.fold(
        (l) {
          debugPrint('=================My Famous types :$l ');
          emit(FamousTypesState.error(error: KFailure.toError(l)));
        },
        (r) {
          famousTypes = r;
          debugPrint('=================My Famous types:$r ');
          emit(FamousTypesState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('=================My Payment  catch $e  ');
    }
  }
}
