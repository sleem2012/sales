import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/change_pass/change_pass_model.dart';
import '../../../../shared/error/failures.dart';
import '../../../repo/auth/auth_repo.dart';
import 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(const ChangePassState.initial());

  static ChangePassCubit of(BuildContext context) {
    return BlocProvider.of<ChangePassCubit>(context);
  }

  bool isVisible = true;

  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  ChangePasswordModel? changePasswordModel = ChangePasswordModel(
    confirmNewPass: "",
    newPass: "",
    currentPass: "",
  );

  togglePassV() {
    isVisible = !isVisible;
    emit(const ChangePassState.loading());
    emit(const ChangePassState.initial());
  }

  changePass() async {
    emit(const ChangePassState.loading());
    try {
      changePasswordModel = changePasswordModel?.copyWith(
        currentPass: currentPassController.text,
        newPass: newPassController.text,
        confirmNewPass: confirmPassController.text,
      );
      final result = await AuthRepoImpl.i.changePassword(changePasswordModel!);
      result.fold(
        (l) {
          emit(ChangePassState.error(failure: l));
          debugPrint('================= Change Password   (Bloc): Failed $l ');
        },
        (r) {
          emit(const ChangePassState.success());
          debugPrint('================= Change Password (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Change Password  (Bloc) (catch):  $e');
      emit(const ChangePassState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
