import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../../packages/shared/error/failures.dart';
import 'get_famous_attrs_state.dart';

class GetFamousAttrsBloc extends Cubit<GetFamousAttrsState> {
  GetFamousAttrsBloc({required this.getFamousAttrsRepoImp}) : super(const GetFamousAttrsState.loading());

  static GetFamousAttrsBloc of(BuildContext context) => BlocProvider.of<GetFamousAttrsBloc>(context);

  final BranchStaffRepoImpl getFamousAttrsRepoImp;

  get() async {
    try {
      emit(const GetFamousAttrsState.loading());
      final result = await getFamousAttrsRepoImp.get_famous_fields();
      result.fold(
        (l) {
          debugPrint('================= GetFamousAttrs Bloc : ${KFailure.toError(l)}');
          emit(GetFamousAttrsState.error(error: l));
        },
        (r) {
          debugPrint('================= GetFamousAttrs Bloc : ${r.toString()}  ');
          emit(GetFamousAttrsState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= GetFamousAttrs Bloc (Catch): ${e.toString()} ');
      emit(const GetFamousAttrsState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
