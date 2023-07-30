import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../di.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import '../../models/currencies/currencies_model.dart';
import '../../models/language/languages_model.dart';
import '../../models/location/adress_model.dart';
import '../../models/location/cities_model.dart';
import '../../models/location/countries_model.dart';
import '../../models/settings/settings_model.dart';

abstract class _GlobalRepoAbs {
  Future<Either<KFailure, SettingsModel>> getSettings();
  Future<Either<KFailure, CountriesModel>> getCountries();
  Future<Either<KFailure, AddressModel>> getAddresses();
  Future<Either<KFailure, CitiesModel>> getCities(String countryId);
  Future<Either<KFailure, LanguagesModel>> getLanguages();
  Future<Either<KFailure, CurrenciesModel>> getCurrencies();
}

class GlobalRepoImpl implements _GlobalRepoAbs {
  static GlobalRepoImpl? _instance;

  GlobalRepoImpl._internal() {
    _instance = this;
  }

  static GlobalRepoImpl get i {
    return _instance ?? GlobalRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, SettingsModel>> getSettings() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.settings);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SettingsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CountriesModel>> getCountries() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.countries);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CountriesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, AddressModel>> getAddresses() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.addresses);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(AddressModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CitiesModel>> getCities(String countryId) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.cities, params: {"country_id": countryId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CitiesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, LanguagesModel>> getLanguages() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.lang);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(LanguagesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CurrenciesModel>> getCurrencies() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.currencies);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CurrenciesModel.fromJson(r)),
    );
  }
}
