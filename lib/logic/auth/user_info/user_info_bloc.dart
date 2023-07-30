import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/modules/repo/auth/auth_repo.dart';
import '../../../packages/modules/models/user_info/user_model.dart';
import 'user_info_state.dart';
import '../../../packages/cache/locale_storage.dart';

import '../../../../packages/shared/error/failures.dart';

class UserInfoBloc extends Cubit<UserInfoState> {
  UserInfoBloc({required this.authRepoImpl}) : super(const UserInfoState.initial());

  static UserInfoBloc of(BuildContext context) {
    return BlocProvider.of<UserInfoBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  UserModel? _userModel;

  UserModel? get user {
    _userModel = KStorage.i.getUserInfo;
    return _userModel;
  }

  getUserInfo() async {
    try {
      emit(const UserInfoState.loading());

      final result = await authRepoImpl.userInfo(KStorage.i.getFcmToken ?? '');
      result.fold(
        (l) {
          emit(UserInfoState.error(failure: l));
          debugPrint('================= User info (Bloc): Failed => $l ');
        },
        (r) {
          _userModel = r;
          KStorage.i.setToken(_userModel?.data?.token ?? '');
          KStorage.i.setUserInfo(_userModel);
          emit(UserInfoState.success(userModel: _userModel!));
        },
      );
    } catch (e) {
      debugPrint('================= User Info Bloc Ex : $e ');
      emit(const UserInfoState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
      rethrow;
    }
  }
}
