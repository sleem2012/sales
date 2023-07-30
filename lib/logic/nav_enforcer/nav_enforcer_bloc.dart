import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../packages/modules/repo/auth/auth_repo.dart';
import '../../packages/modules/repo/company/company_repo.dart';
import '../../packages/modules/view/auth/pin_code/pin_code_screen.dart';
import '../../packages/modules/view/splash/splash_screen.dart';
import '../../packages/shared/error/failures.dart';
import '../../views/company/new/create_company_dui.dart';
import '../../views/famous/famous_wrapper.dart';
import '../../views/main_screen/main_screen.dart';
import '../../views/wating_screen/waiting_screen.dart';
import 'nav_enforcer_state.dart';

class NavEnforcerBloc extends Cubit<NavEnforcerState> {
  NavEnforcerBloc(this.authRepoImpl) : super(const NavEnforcerState.toSuccess(destination: SplashScreen()));

  static NavEnforcerBloc of(BuildContext context) => BlocProvider.of<NavEnforcerBloc>(context);
  final AuthRepoImpl authRepoImpl;

  FutureOr<void> checkUser({String? msg, required Widget destination}) async {
    emit(const NavEnforcerState.loading());

    try {
      final results = await Future.wait<Either<KFailure, dynamic>>([
        AuthRepoImpl.i.userInfo(KStorage.i.getFcmToken ?? ''),
        CompanyRepoImpl.i.getCompany(),
      ]);
      Either<KFailure, dynamic> userRes = results[0];
      Either<KFailure, dynamic> compRes = results[1];
      // final result = await authRepoImpl.userInfo(KStorage.i.getFcmToken);

      userRes.fold(
        (l) {
          l.maybeWhen(
            orElse: () {
              debugPrint('NavEnforcerState =================>>> 0 >>> UnHandled Nav Response Code  $l');
              emit(NavEnforcerState.error(error: l.toString()));
            },
            error409: () {
              emit(NavEnforcerState.toSuccess(msg: msg, destination: const PinCodeScreen(destination: MainNavigationView())));
            },
          );
        },
        (user) {
          if (user.data?.language?.symbols != KStorage.i.getLang) {
            Di.updateUserBloc.updateLang;
          }

          if (!(user.data?.is_email_verified ?? true)) {
            emit(NavEnforcerState.toSuccess(msg: msg, destination: const PinCodeScreen(destination: MainNavigationView())));
            return;
          }
          if (user.data?.type?.id == 13) {
            emit(const NavEnforcerState.toSuccess(destination: WaitingScreen()));
            return;
          }
          if (user.data?.type?.id == 16) {
            emit(const NavEnforcerState.toSuccess(destination: FamousWrapper()));
            return;
          }
          compRes.fold(
            (l) {
              emit(NavEnforcerState.error(error: l.toString()));
              debugPrint('================= User info (Bloc): Failed => $l ');
            },
            (r) {
              final CompanyModel? company = (r as List<CompanyModel>).firstOrNull;
              KStorage.i.setToken(user?.data?.token ?? '');
              if (user.data?.companyBranch == null && company == null) {
                emit(NavEnforcerState.toSuccess(destination: const CreateCompanyDUIView(), msg: msg));
                return;
              }
              if (user.data?.userCompany?.isLock ?? user.data?.companyBranch?.company?.isLock ?? true) {
                emit(NavEnforcerState.toSuccess(msg: msg, destination: const CompanyLockedView()));
                return;
              }
              debugPrint('================= company success');
              KStorage.i.setUserInfo(user..data?.copyWith(userCompany: company));
            },
          );
          emit(NavEnforcerState.toSuccess(msg: msg, destination: destination));
        },
      );
    } catch (e) {
      emit(NavEnforcerState.error(error: e.toString()));
      rethrow;
    }
  }
}

class Nav {
  static final navigator = GlobalKey<NavigatorState>();

  static final BuildContext? _context = navigator.currentState?.context;

  static void removeAllFocus() => FocusScope.of(_context!).unfocus();

  static Future<T?> to<T>(Widget page) async {
    removeAllFocus();
    return await Navigator.push<T>(_context!, MaterialPageRoute<T>(builder: (context) => page));
  }

  static Future<Future<T?>> offAll<T>(Widget page) async {
    removeAllFocus();
    return Navigator.pushAndRemoveUntil<T>(_context!, MaterialPageRoute<T>(builder: (context) => page), (route) => false);
  }

  static Future<Future<T?>> toRoute<T>(Route<T> route) async {
    removeAllFocus();
    return Navigator.push<T>(_context!, route);
  }

  static Future<Future<R?>> replace<R, T>(Widget page, {T? result}) async {
    removeAllFocus();
    return Navigator.pushReplacement<R, T>(_context!, MaterialPageRoute<R>(builder: (context) => page), result: result);
  }

  static Future<void> back<T>({T? result}) async {
    removeAllFocus();
    return Navigator.pop<T>(_context!, result);
  }

  static Future<void> sysPop<T>() async => SystemNavigator.pop();

  static void popUntil(RoutePredicate predicate) {
    removeAllFocus();
    return Navigator.popUntil(_context!, predicate);
  }
}
