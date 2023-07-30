import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/error/failures.dart';
import '../../../repo/auth/auth_repo.dart';
import 'reset_pass_state.dart';

class ResetPasswordBloc extends Cubit<ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState.initial());

  static ResetPasswordBloc of(BuildContext context) {
    return BlocProvider.of<ResetPasswordBloc>(context);
  }

  reset({required String password, required String passwordConf}) async {
    emit(const ResetPasswordState.loading());
    try {
      final result = await AuthRepoImpl.i.resetPassword(password: password, passwordConf: passwordConf);

      result.fold(
        (l) {
          emit(ResetPasswordState.error(failure: l));
          debugPrint('================= Reset Password   (Bloc): Failed $l ');
        },
        (r) {
          emit(const ResetPasswordState.success());
          debugPrint('================= Reset Password (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Reset Password  (Bloc) (catch):  $e');
      emit(const ResetPasswordState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
