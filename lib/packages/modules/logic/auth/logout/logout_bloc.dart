import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../packages/shared/error/failures.dart';
import '../../../../cache/locale_storage.dart';
import '../../../repo/auth/auth_repo.dart';
import 'logout_state.dart';

class LogoutBloc extends Cubit<LogoutState> {
  LogoutBloc({required this.authRepoImpl}) : super(const LogoutState.initial());

  static LogoutBloc of(BuildContext context) {
    return BlocProvider.of<LogoutBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  logout() async {
    try {
      KStorage.i.delToken;
      KStorage.i.delUserInfo;
      emit(const LogoutState.success());

      await authRepoImpl.logout();
    } catch (e) {
      debugPrint('================= logout   (Bloc) (catch):  $e');
      emit(const LogoutState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
