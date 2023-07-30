import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../models/currencies/currencies_model.dart';
import '../../repo/global/global_repo.dart';
import 'currencies_state.dart';
import '../../../cache/locale_storage.dart';
import '../../../shared/error/failures.dart';
import '../../../extensions.dart';

class CurrenciesBloc extends Cubit<CurrenciesState> {
  CurrenciesBloc() : super(const CurrenciesState.initial());

  static CurrenciesBloc of(BuildContext context) {
    return BlocProvider.of<CurrenciesBloc>(context);
  }

  CurrenciesModel? currenciesModel;
  Future getCurrencies() async {
    emit(const CurrenciesState.loading());
    try {
      final result = await GlobalRepoImpl.i.getCurrencies();
      result.fold(
        (l) {
          debugPrint('================= Get Currencies: $l ');

          emit(CurrenciesState.error(error: KFailure.toError(l)));
        },
        (r) {
          currenciesModel = r;
          emit(CurrenciesState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Get Currencies Error: $e  ');
      emit(CurrenciesState.error(error: Tr.get.something_went_wrong));
    }
  }

  CurrenciesData? get initCurency => currenciesModel?.data?.firstWhereOrNull((element) => element.id.toString() == KStorage.i.getcurrencyId);

  selectCurrency(CurrenciesData? currencyDatum) {
    emit(const CurrenciesState.loading());

    KStorage.i.setCurrency(currencyDatum?.symbols ?? '');
    KStorage.i.setCurrencyId(currencyDatum?.id ?? 2);
    emit(CurrenciesState.success(model: currenciesModel!));
  }
}
