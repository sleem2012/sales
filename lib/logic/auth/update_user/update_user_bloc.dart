import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/modules/models/user_info/udate_user_model.dart';
import '../../../packages/modules/repo/auth/auth_repo.dart';
import '../../../packages/shared/theme/logger.dart';
import '../../../views/widgets/slug_drop_down.dart';
import 'update_user_state.dart';

class UpdateUserBloc extends Cubit<UpdateUserState> {
  UpdateUserBloc({required this.authRepoImpl}) : super(const UpdateUserState.initial());

  static UpdateUserBloc of(BuildContext context) {
    return BlocProvider.of<UpdateUserBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  final TextEditingController nameCtrl = TextEditingController(text: KStorage.i.getUserInfo?.data?.name);
  final TextEditingController phoneCtrl = TextEditingController(text: KStorage.i.getUserInfo?.data?.mobile?.replaceAll(RegExp('[^0-9]'), ''));
  final TextEditingController emailCtrl = TextEditingController(text: KStorage.i.getUserInfo?.data?.email);
  final TextEditingController birthdateController = TextEditingController(text: KStorage.i.getUserInfo?.data?.birthdate?.replaceAll(RegExp('[^0-9]'), '_'));

  String cCode = '';
  UpdateUserModel? updateUserModel = UpdateUserModel(
    birthdate: KStorage.i.getUserInfo?.data?.birthdate,
    gender: KStorage.i.getUserInfo?.data?.gender,
    currencyId: KStorage.i.getcurrencyId,
    langId: KStorage.i.getLangId,
    id: KStorage.i.getUserInfo?.data?.id.toString(),
  );
  KSlugModel? selectedGender = KSlugModel.of(KStorage.i.getUserInfo?.data?.gender ?? '');

  update() async {
    try {
      // updateUserModel = updateUserModel?.copyWith(
      //   name: nameCtrl.text,
      //   email: emailCtrl.text,
      //   mobile: phoneCtrl.text,
      //   gender: selectedGender?.slug,
      // );

      printMap(updateUserModel?.toJson());
      //return;
      emit(const UpdateUserState.loading());

      final result = await authRepoImpl.updateUser(model: updateUserModel!);
      result.fold(
        (l) {
          emit(UpdateUserState.error(failure: l));
          debugPrint('================= Login (Bloc): Failed => $l ');
        },
        (r) {
          emit(const UpdateUserState.success());
        },
      );
    } catch (e) {
      debugPrint('================= Login (Bloc) (catch):  $e');
      emit(const UpdateUserState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
      rethrow;
    }
  }

  get blockAccount {
    updateUserModel = updateUserModel?.copyWith(is_blocked: 1);
  }

  get updateLang async {
    authRepoImpl.updateUser(model: UpdateUserModel(langId: KStorage.i.getLangId, id: KStorage.i.getUserInfo?.data?.id.toString()));
  }

  selectGender(KSlugModel? selected) {
    selectedGender = selected ?? KSlugModel.genders.first;
    updateUserModel = updateUserModel?.copyWith(gender: selected?.slug);
    _update;
  }

  selectImage(File? image) async {
    if (image != null) {
      updateUserModel = updateUserModel?.copyWith(image: image);
      _update;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        //birthdateController.text = value.toString().split(' ').first;
        updateUserModel = updateUserModel?.copyWith(birthdate: value.toString().split(' ').first);
        debugPrint('================= ${updateUserModel?.birthdate}');
        _update;
        return value;
      } else {
        return null;
      }
    });
  }

  get _update {
    emit(const UpdateUserState.loading());
    emit(const UpdateUserState.initial());
  }
}
