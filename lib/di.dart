import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'data/repository/branch_staff/branches_staff_repo.dart';
import 'data/repository/commission/commission_repo.dart';
import 'data/repository/company/company_repo.dart';
import 'data/repository/dashboard/dashboard_repo.dart';
import 'data/repository/notifications/notificaions_repo.dart';
import 'data/repository/sales_delegate/sales_delegate_repo.dart';
import 'data/repository/search/search_repo.dart';
import 'logic/auth/update_user/update_user_bloc.dart';
import 'logic/auth/user_info/user_info_bloc.dart';
import 'logic/barnch_Staff/add_barnch_staff/add_employee_bloc.dart';
import 'logic/barnch_Staff/block_user/block_user_bloc_cubit.dart';
import 'logic/barnch_Staff/famous/add_famous_attrs/add_famous_attrs_bloc.dart';
import 'logic/barnch_Staff/famous/get_famous_attrs/get_famous_attrs_bloc.dart';
import 'logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import 'logic/barnch_Staff/internal_employee/create_int_emp/internal_employee_cubit.dart';
import 'logic/barnch_Staff/internal_employee/get_fields/get_fields_bloc.dart';
import 'logic/commission/commission_bloc.dart';
import 'logic/company/create_company/company_bloc.dart';
import 'logic/company/create_compny_dui/create/create_company_dui_bloc_bloc.dart';
import 'logic/company/create_compny_dui/get_fields/get_company_fields_bloc.dart';
import 'logic/company/get_company_type/get_company_bloc.dart';
import 'logic/company/update_locked_company/update_locked_company_bloc.dart';
import 'logic/dashboard/update_pending_application/update_application_bloc.dart';
import 'logic/famous/add_famous/add_famous_bloc.dart';
import 'logic/famous/famous_types/famous_types_bloc.dart';
import 'logic/famous/get_famous/get_famous_bloc.dart';
import 'logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'logic/observer.dart';
import 'logic/pick_image/pick_image_cubit.dart';
import 'logic/sales_delegate/add_vendor/add_vendor_bloc.dart';
import 'logic/sales_delegate/get/sales_delegate_bloc.dart';
import 'logic/sales_delegate/update_vendor/update_vendor_bloc.dart';
import 'logic/search_company/search_company_bloc.dart';
import 'logic/theme/theme_cubit.dart';
import 'main.dart';
import 'packages/chat/data/repo/chat_repo.dart';
import 'packages/chat/logic/msg_bloc/messages_bloc.dart';
import 'packages/chat/logic/rooms_bloc/chat_rooms_bloc.dart';
import 'packages/core/notifications_ctrl/notifications_ctrl.dart';
import 'packages/core/socket/socket_ctrl.dart';
import 'packages/modules/logic/auth/change_pass/change_pass_cubit.dart';
import 'packages/modules/logic/auth/forget_pass/forget_pass_bloc.dart';
import 'packages/modules/logic/auth/login/login_bloc.dart';
import 'packages/modules/logic/auth/logout/logout_bloc.dart';
import 'packages/modules/logic/auth/register/register_bloc.dart';
import 'packages/modules/logic/auth/reset_pass/reset_pass_bloc.dart';
import 'packages/modules/logic/auth/verfiy_code/verfiy_code_bloc.dart';
import 'packages/modules/logic/branches/get_branches/branches_bloc.dart';
import 'packages/modules/logic/category/add_category/add_category_cubit.dart';
import 'packages/modules/logic/category/category_bloc.dart';
import 'packages/modules/logic/currencies/currencies_bloc.dart';
import 'packages/modules/logic/language/langugese_bloc.dart';
import 'packages/modules/logic/location/location/location_bloc.dart';
import 'packages/modules/logic/settings/settings_bloc.dart';
import 'packages/modules/repo/auth/auth_repo.dart';
import 'packages/modules/view/notifications/bloc/get_notifications_bloc.dart';
import 'packages/payment/logic/add_card_bloc/add_payment_card_bloc.dart';
import 'packages/payment/logic/add_payment_bloc/add_payment_bloc.dart';
import 'packages/payment/logic/get_banks/get_banks_bloc.dart';
import 'packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import 'packages/payment/logic/get_tyeps_bloc/get_payment_type_bloc.dart';
import 'packages/shared/api_client/api_client_impl.dart';
import 'packages/shared/api_client/endpoints.dart';
import 'packages/shared/api_middleware_bloc/api_client_bloc.dart';
import 'packages/shared/picker/logic/country_search_cubit/country_search_cubit.dart';

abstract class Di {
  static final GetIt _i = GetIt.instance;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    Bloc.observer = MyBlocObserver();
    await NotificationCtrl.fcm_init('Forall Sales');
    _reg();
  }

  static Future reset(context) async {
    await _unReg();
    RestartWidget.restartApp(context);
    await _i.resetScope(dispose: true);
    _reg();
  }

  static _reg() {
    _i.registerSingleton<SocketCtrl>(SocketCtrl(KEndPoints.socket)..init);

    _i.registerLazySingleton(() => DioClientImpl(apiClientBloc: _i()));
    _i.registerLazySingleton(() => Connectivity());
    _i.registerLazySingleton(() => ThemeBloc());
    _i.registerLazySingleton(() => ApiClientBloc());
    _i.registerLazySingleton(() => ImagePicker());

    _i.registerFactory(() => NavEnforcerBloc(_i()));
    _i.registerFactory(() => CurrenciesBloc());
    _i.registerFactory(() => LanguagesBloc());
    _i.registerFactory(() => NotificationsBloc());
    _i.registerFactory(() => SettingsBloc());
    _i.registerFactory(() => BranchesBloc());
    _i.registerFactory(() => BranchStaffBloc(branchStaffRepoImpl: _i()));
    _i.registerFactory(() => ChangePassCubit());
    _i.registerFactory(() => LocationBloc());
    _i.registerFactory(() => RegisterBloc());
    _i.registerFactory(() => AddEmployeeBloc(addEmployeeImpl: _i()));
    _i.registerFactory(() => LoginBloc());
    _i.registerFactory(() => VerfiyCodeBloc(authRepoImpl: _i()));
    _i.registerFactory(() => ForgetPasswordBloc());
    _i.registerFactory(() => LogoutBloc(authRepoImpl: _i()));
    _i.registerFactory(() => ResetPasswordBloc());
    _i.registerFactory(() => PickImageCubit());
    _i.registerFactory(() => CompanyBloc(companyRepoImpl: _i()));
    _i.registerFactory(() => GetCompanyBloc(companyRepoImpl: _i()));
    _i.registerFactory(() => UserInfoBloc(authRepoImpl: _i()));
    _i.registerFactory(() => UpdateUserBloc(authRepoImpl: _i()));
    _i.registerFactory(() => BlockUserBloc(addEmployeeImpl: _i()));
    _i.registerFactory(() => AddPaymentTypeBloc());
    _i.registerFactory(() => GetPaymentTypeBloc());
    _i.registerFactory(() => MyPaymentsBloc());
    _i.registerFactory(() => GetSalesDelegateBloc(salesDelegateRepoImp: _i()));
    _i.registerFactory(() => AddVendorBloc(salesDelegateRepoImp: _i()));
    _i.registerFactory(() => UpdateVendorBloc(salesDelegateRepoImp: _i()));
    _i.registerFactory(() => CommissionBloc(commissionRepoImpl: _i()));
    _i.registerFactory(() => UpdateApplicationBloc(dashboardRepoImp: _i()));
    _i.registerFactory(() => GetCompanyFieldsBloc(companyRepoImpl: _i()));
    _i.registerFactory(() => CreateCompanyDuiBlocBloc(companyRepoImpl: _i()));
    _i.registerFactory(() => InternalEmployeeCubit(internalViewImpl: _i()));
    _i.registerFactory(() => InternalEmpFieldsBloc(staffRepoImpl: _i()));
    _i.registerFactory(() => GetFamousAttrsBloc(getFamousAttrsRepoImp: _i()));
    _i.registerFactory(() => AddFamousAttrsBloc(addFamousAttrsRepoImp: _i()));
    _i.registerFactory(() => AddCardBloc());
    _i.registerFactory(() => AddFamousBloc(branchStaffRepoImpl: _i()));
    _i.registerFactory(() => FamousTypesBloc(branchStaffRepoImpl: _i()));
    _i.registerFactory(() => GetFamousBloc(branchStaffRepoImpl: _i()));
    _i.registerFactory(() => GetBanksBloc());
    _i.registerFactory(() => UpdateLockedCompanyBloc(companyRepoImpl: _i()));
    _i.registerFactory(() => SearchCompanyBloc(searchRepoImpl: _i()));
    _i.registerFactory(() => CountrySearchCubit());

    ///Repos
    _i.registerLazySingleton(() => AuthRepoImpl());
    _i.registerLazySingleton(() => BranchStaffRepoImpl());
    _i.registerLazySingleton(() => CompanyRepoImpl());
    _i.registerLazySingleton(() => NotificationsRepoImpl());
    _i.registerLazySingleton(() => SalesDelegateRepoImp());
    _i.registerLazySingleton(() => CommissionRepoImpl());
    _i.registerLazySingleton(() => DashboardRepoImp());
    _i.registerLazySingleton(() => SearchRepoImpl());

    ///Chat
    _i.registerLazySingleton(() => EmojiParser());
    _i.registerFactory(() => ChatRoomsBloc());
    _i.registerFactory(() => MessagesBloc());
  }

  static _unReg() async {
    await _i.unregister<DioClientImpl>();
    await _i.unregister<SocketCtrl>();
    await _i.unregister<SearchCompanyBloc>();
    await _i.unregister<SearchRepoImpl>();
    await _i.unregister<Connectivity>();
    await _i.unregister<NotificationsBloc>();
    await _i.unregister<ThemeBloc>();
    await _i.unregister<ApiClientBloc>();
    await _i.unregister<LanguagesBloc>();
    await _i.unregister<UpdateApplicationBloc>();
    await _i.unregister<DashboardRepoImp>();
    await _i.unregister<SettingsBloc>();
    await _i.unregister<LocationBloc>();
    await _i.unregister<BranchesBloc>();
    await _i.unregister<BranchStaffBloc>();
    await _i.unregister<AddFamousBloc>();
    await _i.unregister<ChangePassCubit>();
    await _i.unregister<CountrySearchCubit>();
    await _i.unregister<CurrenciesBloc>();
    await _i.unregister<UpdateLockedCompanyBloc>();
    await _i.unregister<RegisterBloc>();
    await _i.unregister<AddEmployeeBloc>();
    await _i.unregister<InternalEmployeeCubit>();
    await _i.unregister<PickImageCubit>();
    await _i.unregister<CompanyBloc>();
    await _i.unregister<GetCompanyBloc>();
    await _i.unregister<UserInfoBloc>();
    await _i.unregister<LoginBloc>();
    await _i.unregister<FamousTypesBloc>();
    await _i.unregister<UpdateUserBloc>();
    await _i.unregister<VerfiyCodeBloc>();
    await _i.unregister<AddCardBloc>();
    await _i.unregister<GetFamousBloc>();

    await _i.unregister<ForgetPasswordBloc>();
    await _i.unregister<LogoutBloc>();
    await _i.unregister<ResetPasswordBloc>();
    await _i.unregister<NavEnforcerBloc>();
    await _i.unregister<BlockUserBloc>();
    await _i.unregister<AddPaymentTypeBloc>();
    await _i.unregister<GetPaymentTypeBloc>();
    await _i.unregister<MyPaymentsBloc>();
    await _i.unregister<GetSalesDelegateBloc>();
    await _i.unregister<AddVendorBloc>();
    await _i.unregister<UpdateVendorBloc>();
    await _i.unregister<CommissionBloc>();

    await _i.unregister<AuthRepoImpl>();
    await _i.unregister<BranchStaffRepoImpl>();
    await _i.unregister<CompanyRepoImpl>();
    await _i.unregister<NotificationsRepoImpl>();
    await _i.unregister<SalesDelegateRepoImp>();
    await _i.unregister<CommissionRepoImpl>();

    await _i.unregister<CreateCompanyDuiBlocBloc>();
    await _i.unregister<GetCompanyFieldsBloc>();
    await _i.unregister<InternalEmpFieldsBloc>();
    await _i.unregister<GetFamousAttrsBloc>();
    await _i.unregister<AddFamousAttrsBloc>();
    await _i.unregister<GetBanksBloc>();

    ///Chat
    await _i.unregister<ChatRoomsBloc>();
    await _i.unregister<MessagesBloc>();
    await _i.unregister<EmojiParser>();
    await _i.unregister<ImagePicker>();
  }

  // getters
  static DioClientImpl get dioClient => _i.get<DioClientImpl>();

  static Connectivity get connectivity => _i.get<Connectivity>();

  static NotificationsBloc get getNotifications => _i.get<NotificationsBloc>();

  static ThemeBloc get themeBloc => _i.get<ThemeBloc>();

  static ApiClientBloc get apiClientBloc => _i.get<ApiClientBloc>();

  static UpdateApplicationBloc get updateApplication => _i.get<UpdateApplicationBloc>();

  static LanguagesBloc get languagesBloc => _i.get<LanguagesBloc>();

  static SettingsBloc get settingsBloc => _i.get<SettingsBloc>();

  static LocationBloc get locationBloc => _i.get<LocationBloc>();

  static BranchesBloc get branchBloc => _i.get<BranchesBloc>();

  static BranchStaffBloc get branchStaffBloc => _i.get<BranchStaffBloc>();

  static ChangePassCubit get changePass => _i.get<ChangePassCubit>();

  static CurrenciesBloc get currenciesBloc => _i.get<CurrenciesBloc>();

  static RegisterBloc get registerBloc => _i.get<RegisterBloc>();

  static AddEmployeeBloc get addEmployeeBloc => _i.get<AddEmployeeBloc>();

  static PickImageCubit get pickImageCubit => _i.get<PickImageCubit>();

  static CompanyBloc get companyBloc => _i.get<CompanyBloc>();

  static GetCompanyBloc get getCompanyBloc => _i.get<GetCompanyBloc>();

  static UserInfoBloc get userInfoBloc => _i.get<UserInfoBloc>();

  static UpdateUserBloc get updateUserBloc => _i.get<UpdateUserBloc>();

  static LoginBloc get loginBloc => _i.get<LoginBloc>();

  static VerfiyCodeBloc get verfiyCodeBloc => _i.get<VerfiyCodeBloc>();

  static ForgetPasswordBloc get forgetPasswordBloc => _i.get<ForgetPasswordBloc>();

  static LogoutBloc get logoutBloc => _i.get<LogoutBloc>();

  static ResetPasswordBloc get resetPasswordBloc => _i.get<ResetPasswordBloc>();

  static NavEnforcerBloc get navEnforcerBloc => _i.get<NavEnforcerBloc>();

  static BlockUserBloc get blockUserBloc => _i.get<BlockUserBloc>();

  static AddPaymentTypeBloc get addPaymentTypeBloc => _i.get<AddPaymentTypeBloc>();

  static GetPaymentTypeBloc get getPaymentTypeBloc => _i.get<GetPaymentTypeBloc>();

  static MyPaymentsBloc get myPaymentsBloc => _i.get<MyPaymentsBloc>();

  static GetSalesDelegateBloc get salesDelegateBloc => _i.get<GetSalesDelegateBloc>();

  static AddVendorBloc get addVendorBloc => _i.get<AddVendorBloc>();

  static UpdateVendorBloc get updateVendorBloc => _i.get<UpdateVendorBloc>();

  static CommissionBloc get commissionBloc => _i.get<CommissionBloc>();

  static AddFamousBloc get addFamous => _i.get<AddFamousBloc>();

  static CountrySearchCubit get countrySearchCubit => _i.get<CountrySearchCubit>();

  static SearchCompanyBloc get search => _i.get<SearchCompanyBloc>();

  ///Chat
  static ChatRoomsBloc get chatBloc => _i.get<ChatRoomsBloc>();

  static MessagesBloc get sendMsgBloc => _i.get<MessagesBloc>();

  static ChatRepoImp get chatRepo => _i.get<ChatRepoImp>();

  static EmojiParser get emojiParser => _i.get<EmojiParser>();

  static SocketCtrl get socket => _i.get<SocketCtrl>();

  static ImagePicker get imagePicker => _i.get<ImagePicker>();

  static InternalEmployeeCubit get internalEmployeeCubit => _i.get<InternalEmployeeCubit>();

  static GetCompanyFieldsBloc get getCompanyFieldsBloc => _i.get<GetCompanyFieldsBloc>();

  static CreateCompanyDuiBlocBloc get createCompanyDuiBlocBloc => _i.get<CreateCompanyDuiBlocBloc>();

  static InternalEmpFieldsBloc get internalEmpFieldsBloc => _i.get<InternalEmpFieldsBloc>();

  static AddCardBloc get addCardBloc => _i.get<AddCardBloc>();

  static AddFamousAttrsBloc get addFamousAttrsBloc => _i.get<AddFamousAttrsBloc>();

  static GetFamousAttrsBloc get getFamousAttrsBloc => _i.get<GetFamousAttrsBloc>();

  static FamousTypesBloc get getFamousTypes => _i.get<FamousTypesBloc>();

  static GetFamousBloc get getFamous => _i.get<GetFamousBloc>();

  static GetBanksBloc get getBanksBloc => _i.get<GetBanksBloc>();

  static UpdateLockedCompanyBloc get updateLockedCompany => _i.get<UpdateLockedCompanyBloc>();
  static AddCategoryCubit get addCategoryCubit => _i.get<AddCategoryCubit>();
  static CategoryBloc get categoryBloc => _i.get<CategoryBloc>();
}
