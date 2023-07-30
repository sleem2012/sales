import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cache/locale_storage.dart';
import '../../../../shared/error/failures.dart';
import '../../../models/user_info/user_model.dart';
import '../../../repo/auth/auth_repo.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState.initial());

  static LoginBloc of(BuildContext context) {
    return BlocProvider.of<LoginBloc>(context);
  }

  UserModel? userModel;

  bool isVisible = true;

  login({required String email, required String password}) async {
    emit(const LoginState.loading());

    try {
      final result = await AuthRepoImpl.i.login(email: email, password: password);
      result.fold(
        (l) {
          emit(LoginState.error(failure: l));
          debugPrint('================= Login (Bloc): Failed => $l ');
        },
        (r) {
          userModel = r;
          KStorage.i.setToken(userModel?.data?.token ?? '');
          KStorage.i.setUserInfo(userModel);
          KStorage.i.setDefaultMail(userModel?.data?.email);

          emit(LoginState.success(loginModel: userModel!));
          debugPrint('================= Login (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Login (Bloc) (catch):  $e');
      emit(const LoginState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  togglePassV() {
    isVisible = !isVisible;
    emit(const LoginState.loading());
    emit(const LoginStateInitial());
  }
}
