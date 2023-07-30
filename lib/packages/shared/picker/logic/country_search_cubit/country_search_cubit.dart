import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../packages/shared/error/failures.dart';
import '../../../localization/trans.dart';
import '../../data/country_search_model/country_search_model.dart';
import '../../data/country_search_repo/country_search_repo.dart';
import 'country_search_state.dart';

class CountrySearchCubit extends Cubit<CountrySearchState> {
  CountrySearchCubit() : super(const CountrySearchState.initial());

  static CountrySearchCubit of(context) => BlocProvider.of(context);

  CountrySearchModel? countrySearchModel;

  search(String type, String country, String state) async {
    emit(const CountrySearchState.loading());
    try {
      final result = await CountrySearchRepoImpl.i.search(type: type, city: state, country: country);
      result.fold(
        (l) {
          emit(CountrySearchState.error(error: KFailure.toError(l)));
          debugPrint('================= getSchedule (Bloc) : $l  ');
        },
        (r) {
          countrySearchModel = r;
          emit(const CountrySearchState.success());
        },
      );
    } catch (e) {
      debugPrint('================= getSchedule (Bloc) (catch) : $e  ');
      emit(CountrySearchState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}
