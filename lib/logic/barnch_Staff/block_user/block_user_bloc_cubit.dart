import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/branch_staff/branches_staff_repo.dart';
import 'block_user_bloc_state.dart';
import '../../../../packages/shared/error/failures.dart';

class BlockUserBloc extends Cubit<BlockUserState> {
  BlockUserBloc({required this.addEmployeeImpl}) : super(const BlockUserState.initial());

  static BlockUserBloc of(BuildContext context) {
    return BlocProvider.of<BlockUserBloc>(context);
  }

  final BranchStaffRepoImpl addEmployeeImpl;

  block({required int id, int? isBlocked, String? reason, int? requiredContract}) async {
    emit(const BlockUserState.loading());
    try {
      final result = await addEmployeeImpl.blockUser(id: id, isBlocked: isBlocked, reason: reason);
      result.fold(
        (l) {
          emit(BlockUserState.error(failure: l));
          debugPrint('================= blockuser (Bloc) : $l  ');
        },
        (r) {
          emit(const BlockUserState.success());
        },
      );
    } catch (e) {
      debugPrint('================= blockuser (Bloc) (catch) : $e  ');
      emit(const BlockUserState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
