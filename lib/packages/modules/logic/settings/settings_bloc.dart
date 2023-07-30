import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';
import '../../../cache/locale_storage.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../models/settings/settings_model.dart';
import '../../repo/global/global_repo.dart';
import 'settings_state.dart';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc() : super(const SettingsState.initial());

  static SettingsBloc of(BuildContext context) {
    return BlocProvider.of<SettingsBloc>(context);
  }

  SettingsModel? settingsModel;
  bool? isUpdate;

  Future getSettings() async {
    emit(const SettingsState.loading());
    try {
      final result = await GlobalRepoImpl.i.getSettings();
      result.fold(
        (l) {
          emit(SettingsState.error(error: KFailure.toError(l)));
          debugPrint('================= Settings (Bloc) : $l  ');
        },
        (r) {
          settingsModel = r;
          KStorage.i.setSettings(settingsModel);
          if ((r.data?.first.appVersion?.toJson()[appName] ?? 0) <= KEndPoints.appVersion) {
            isUpdate = false;
          } else {
            isUpdate = true;
          }

          emit(SettingsState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Settings (Bloc) (catch) : $e  ');
      emit(SettingsState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}
