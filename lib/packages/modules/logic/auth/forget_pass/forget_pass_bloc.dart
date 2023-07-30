import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/error/failures.dart';
import '../../../repo/auth/auth_repo.dart';
import 'forget_pass_state.dart';

class ForgetPasswordBloc extends Cubit<ForgetPasswordState> {
  ForgetPasswordBloc() : super(const ForgetPasswordState.initial());

  static ForgetPasswordBloc of(BuildContext context) {
    return BlocProvider.of<ForgetPasswordBloc>(context);
  }

  sendCode({required String email}) async {
    emit(const ForgetPasswordState.loading());
    try {
      final result = await AuthRepoImpl.i.forgetPassword(email: email);

      result.fold(
        (l) {
          emit(ForgetPasswordState.error(failure: l));
          debugPrint('================= Forget Password   (Bloc): Failed $l ');
        },
        (r) {
          emit(const ForgetPasswordState.success());
          debugPrint('================= Forget Password (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      emit(const ForgetPasswordState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
      debugPrint('================= Forget Password  (Bloc) (catch):  $e');
    }
  }
}
