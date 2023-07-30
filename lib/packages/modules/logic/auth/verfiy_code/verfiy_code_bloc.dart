import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cache/locale_storage.dart';
import '../../../../shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../../../repo/auth/auth_repo.dart';
import 'verfiy_code_state.dart';

class VerfiyCodeBloc extends Cubit<VerfiyCodeState> {
  VerfiyCodeBloc({required this.authRepoImpl}) : super(const VerfiyCodeState.initial());

  static VerfiyCodeBloc of(BuildContext context) {
    return BlocProvider.of<VerfiyCodeBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  verfiyCode({required String token, String? email}) async {
    emit(const VerfiyCodeState.loading());
    try {
      final result = await authRepoImpl.verifyToken(token: token, email: email);

      result.fold(
        (l) {
          emit(VerfiyCodeState.error(error: KFailure.toError(l)));
          debugPrint('================= Verfiy Code  (Bloc): Failed $l ');
        },
        (r) {
          emit(const VerfiyCodeState.success());
          KStorage.i.setToken(r);
          debugPrint('================= Verfiy Code  (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Verfiy Code  (Bloc) (catch):  $e');
      emit(VerfiyCodeState.error(error: Tr.get.something_went_wrong));
    }
  }
}
