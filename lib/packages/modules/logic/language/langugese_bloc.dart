import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/localization/trans.dart';
import '../../models/language/languages_model.dart';
import '../../repo/global/global_repo.dart';
import '../../../cache/locale_storage.dart';
import '../../../extensions.dart';
import '../../../shared/error/failures.dart';
import 'languages_states.dart';

class LanguagesBloc extends Cubit<LanguagesState> {
  LanguagesBloc() : super(const LanguagesState.loading());

  static LanguagesBloc of(BuildContext context) {
    return BlocProvider.of<LanguagesBloc>(context);
  }

  LanguagesModel? languagesModel;

  Future getAllLangs() async {
    emit(const LanguagesState.loading());
    try {
      final result = await GlobalRepoImpl.i.getLanguages();
      result.fold(
        (l) {
          debugPrint('================= Lang Bloc $l : ');
          emit(LanguagesState.error(erorr: KFailure.toError(l)));
        },
        (r) {
          languagesModel = r;
          emit(LanguagesState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Lang Bloc Ex : $e : ');
      emit(LanguagesState.error(erorr: Tr.get.something_went_wrong));
    }
  }

  LangDatum? get initLang => languagesModel?.data?.firstWhereOrNull((element) => element.id.toString() == KStorage.i.getLangId);

  selectLang(LangDatum langDatum) {
    emit(const LanguagesState.loading());
    KStorage.i.setLang(langDatum.symbols ?? 'en');
    KStorage.i.setLangId(languagesModel?.data?.where((element) => element.symbols == langDatum.symbols).first.id ?? 2);
    emit(LanguagesState.success(model: languagesModel!));

    getAllLangs();
  }
}
