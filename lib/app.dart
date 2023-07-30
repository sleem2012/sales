import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../packages/shared/error/failures.dart';
import 'di.dart';
import 'logic/main_view/main_view_bloc.dart';
import 'logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'logic/nav_enforcer/nav_enforcer_state.dart';
import 'logic/theme/theme_cubit.dart';
import 'packages/cache/locale_storage.dart';
import 'packages/modules/view/auth/login/login_screen.dart';
import 'packages/modules/view/auth/pin_code/pin_code_screen.dart';
import 'packages/modules/view/onboarding/choose_lang_screen.dart';
import 'packages/modules/view/splash/splash_screen.dart';
import 'packages/shared/api_middleware_bloc/api_client_bloc.dart';
import 'packages/shared/api_middleware_bloc/api_client_state.dart';
import 'packages/shared/localization/trans.dart';
import 'packages/shared/picker/logic/location_cubit/location_cubit.dart';
import 'packages/shared/theme/helper.dart';
import 'packages/shared/theme/theme_data.dart';
import 'views/main_screen/main_screen.dart';
import 'views/widgets/error/error_view.dart';
import 'views/widgets/loading/loading_overlay.dart';
import 'views/widgets/on_success_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.themeBloc..loadTheme()),
        BlocProvider(create: (context) => Di.languagesBloc..getAllLangs()),
        BlocProvider(create: (context) => Di.navEnforcerBloc),
        BlocProvider(create: (context) => Di.apiClientBloc),
        BlocProvider(create: (context) => Di.branchBloc..getBranches()),
        BlocProvider(create: (context) => Di.settingsBloc..getSettings()),
        BlocProvider(create: (context) => Di.currenciesBloc..getCurrencies()),
        BlocProvider(create: (context) => Di.locationBloc..getCountries()),
        BlocProvider(create: (context) => Di.userInfoBloc),
        BlocProvider(create: (context) => Di.logoutBloc),
        BlocProvider(create: (context) => Di.getPaymentTypeBloc..gettypes()),
        BlocProvider(create: (context) => Di.myPaymentsBloc..getMyPayments()),
        BlocProvider(create: (context) => Di.salesDelegateBloc..getVendors()),
        BlocProvider(create: (context) => Di.branchStaffBloc..getStaff()),
        BlocProvider(create: (context) => Di.chatBloc..get_all_rooms()),
        BlocProvider(create: (context) => Di.search),
        BlocProvider(create: (context) => Di.updateVendorBloc),
        BlocProvider(create: (context) => Di.addVendorBloc),
        BlocProvider(create: (context) => GetLocationCubit()),
        BlocProvider(create: (context) => MainViewBloc()),
        BlocProvider(create: (context) => Di.getFamousTypes..getFamousTypes())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocListener<ApiClientBloc, ApiClientState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (failure) {
                  KHelper.showSnackBar(KFailure.toError(failure));
                  failure.whenOrNull(
                    error409: () {
                      Get.offAll(
                        () => PinCodeScreen(
                          destination: const MainNavigationView(),
                          msg: Tr.get.not_verfied,
                        ),
                      );
                    },
                    error401: () {
                      if (KStorage.i.getToken != null) {
                        KStorage.i.delToken;
                        KStorage.i.delUserInfo;
                        Get.offAll(() => const LoginScreen());
                      }
                    },
                  );
                },
              );
            },
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: BlocListener<NavEnforcerBloc, NavEnforcerState>(
                listener: (context, nav) {
                  nav.when(
                    loading: () {
                      Get.offAll(() => const Scaffold(body: KLoadingOverlay(isLoading: true)));
                    },
                    toSuccess: (msg, destination) {
                      if (msg != null) {
                        Get.offAll(() => OnSuccessView(msg: msg, destination: destination));
                      } else {
                        Get.offAll(() => destination);
                      }
                    },
                    error: (msg) {
                      Get.offAll(
                        () => KErrorView(
                          error: msg,
                          onTryAgain: () {
                            Get.offAll(() => const MainNavigationView());
                            Di.reset(context);
                          },
                        ),
                      );
                    },
                  );
                },
                child: GetMaterialApp(
                  title: 'FORALL SALES',
                  navigatorKey: Nav.navigator,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: Tr.delegates,
                  supportedLocales: Tr.supportedLocales,
                  locale: ThemeBloc.of(context).locale,
                  localeResolutionCallback: (Locale? locale, Iterable<Locale> iterable) {
                    return ThemeBloc.of(context).locale;
                  },
                  theme: KThemeData.light,
                  darkTheme: KThemeData.dark,
                  themeMode: ThemeBloc.of(context).themeMode,
                  home: Builder(
                    builder: (context) {
                      return AnnotatedRegion<SystemUiOverlayStyle>(
                        value: KThemeData.of(context).overlayStyle,
                        child: const SplashScreen(),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => nav());
  }

  nav() {
    debugPrint('=================KStorage.i.getLang ===>   ${KStorage.i.getLang}  : KStorage.i.getcurrency ===> ${KStorage.i.getCurrency} ');
    if (KStorage.i.getToken != null) {
      Get.offAll(() => const MainNavigationView());
    } else if (KStorage.i.getLang != null && KStorage.i.getCurrency != null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const ChooseLangScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
