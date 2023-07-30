import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../../../models/location/cities_model.dart';
import '../../../models/location/countries_model.dart';
import '../../../repo/global/global_repo.dart';
import 'location_state.dart';

class LocationBloc extends Cubit<LocationState> {
  LocationBloc() : super(const LocationState.initial());

  static LocationBloc of(BuildContext context) {
    return BlocProvider.of<LocationBloc>(context);
  }

  CountriesModel? countriesModel;
  CitiesModel? citiesModel;

  Future getCountries() async {
    emit(const LocationState.loading());
    try {
      final result = await GlobalRepoImpl.i.getCountries();
      result.fold(
        (l) {
          debugPrint('================= get Countries (Bloc)  :$l ');

          emit(LocationState.error(error: KFailure.toError(l)));
        },
        (r) {
          countriesModel = r;
          emit(const LocationState.success());
        },
      );
    } catch (e) {
      debugPrint('================= get Countries (Bloc)  :$e ');
      emit(LocationState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  Future getCities(String countryId) async {
    emit(const LocationState.loading());
    try {
      final result = await GlobalRepoImpl.i.getCities(countryId);
      result.fold(
        (l) {
          debugPrint('================= get Cities (Bloc)  :$l ');

          emit(LocationState.error(error: KFailure.toError(l)));
        },
        (r) {
          citiesModel = r;
          emit(const LocationState.success());
        },
      );
    } catch (e) {
      debugPrint('================= get Cities (Bloc)  :$e ');
      emit(LocationState.error(error: Tr.get.something_went_wrong));
    }
  }
}
