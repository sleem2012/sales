import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/models/company/company_model.dart';
import '../modules/models/settings/settings_model.dart';
import '../modules/models/user_info/user_model.dart';

class KStorageKeys {
  static const String themeMode = 'themeMode';
  static const String locale = 'locale';
  static const String lang = 'language';
  static const String langId = 'languageId';
  static const String currency = 'currency';
  static const String currencyId = 'currencyId';
  static const String token = 'token';
  static const String fcmToken = 'fcmToken';
  static const String userModel = 'userModel';
  static const String isSplashSeen = 'isSplashSeen';
  static const String settings = 'settings';
  static const String server = 'server';
  static const String defaultMail = 'defaultMail';
  static const String famousCode = 'famousCode';
  static const String company = 'company';

  static const String selectedPaymentId = 'selectedPaymentId';
}

class KStorage {
  KStorage();
  final GetStorage _storage = GetStorage();
  static KStorage i = _kStorage;

  static KStorage get _kStorage {
    if (GetIt.instance.isRegistered<KStorage>()) {
      return GetIt.instance.get<KStorage>();
    } else {
      GetIt.instance.registerLazySingleton(() => KStorage());
      return GetIt.instance.get<KStorage>();
    }
  }

  get erase async => await _storage.erase();

  setLang(String lang) => _storage.write(KStorageKeys.lang, lang);
  String? get getLang => _storage.read(KStorageKeys.lang);

  setLangId(int lang) => _storage.write(KStorageKeys.langId, lang);
  String? get getLangId => _storage.read(KStorageKeys.langId).toString();

  setCurrency(String currency) => _storage.write(KStorageKeys.currency, currency);
  String? get getCurrency => _storage.read(KStorageKeys.currency);

  setCurrencyId(int currency) => _storage.write(KStorageKeys.currencyId, currency);
  String? get getcurrencyId => _storage.read(KStorageKeys.currencyId).toString();

  setToken(String? token) => _storage.write(KStorageKeys.token, token);
  get delToken => _storage.remove(KStorageKeys.token);
  String? get getToken => _storage.read(KStorageKeys.token);

  setUserInfo(UserModel? model) => _storage.write(KStorageKeys.userModel, model?.toJson() as Map<String, dynamic>);
  get delUserInfo => _storage.remove(KStorageKeys.userModel);
  UserModel? get getUserInfo {
    if (_storage.read(KStorageKeys.userModel) != null) {
      return UserModel.fromJson(_storage.read(KStorageKeys.userModel));
    } else {
      return null;
    }
  }

  setCompany(CompanyModel? model) => _storage.write(KStorageKeys.company, model?.toJson() as Map<String, dynamic>);
  CompanyModel? get getCompany {
    if (_storage.read(KStorageKeys.userModel) != null) {
      return CompanyModel.fromJson(_storage.read(KStorageKeys.company));
    } else {
      return null;
    }
  }

  String? get getName => getUserInfo?.data?.name;

  setIsSplashSeen() => _storage.write(KStorageKeys.isSplashSeen, true);
  bool get isSplashSeen => _storage.read(KStorageKeys.isSplashSeen) ?? false;

  setFcmToken(String? token) => _storage.write(KStorageKeys.fcmToken, token);
  String? get getFcmToken => _storage.read(KStorageKeys.fcmToken);

  setServer(String? v) => _storage.write(KStorageKeys.server, v);
  String? get getServer => _storage.read(KStorageKeys.server);

  setSettings(SettingsModel? model) => _storage.write(KStorageKeys.settings, model?.toJson() as Map<String, dynamic>);
  SettingsModel? get getSettings {
    if (_storage.read(KStorageKeys.settings) != null) {
      return SettingsModel.fromJson(_storage.read(KStorageKeys.settings));
    } else {
      return null;
    }
  }

  String? get getvideo {
    if (_storage.read(KStorageKeys.settings) != null) {
      return SettingsModel.fromJson(_storage.read(KStorageKeys.settings)).data?.firstOrNull?.video;
    } else {
      return null;
    }
  }

  ///

  setPaymentId(int id) => _storage.write(KStorageKeys.selectedPaymentId, id);
  int? get getPaymentId => _storage.read(KStorageKeys.selectedPaymentId);

  setDefaultMail(String? email) => _storage.write(KStorageKeys.defaultMail, email);

  String? get getDefaultMail => _storage.read(KStorageKeys.defaultMail);

  setFamous(String? code) => _storage.write(KStorageKeys.famousCode, code);

  String? get getFamous => _storage.read(KStorageKeys.famousCode);
}
