import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'helper.dart';

class KThemeData {
  static BuildContext? _context;
  static KThemeData? _instance;
  KThemeData._internal() {
    _instance = this;
  }
  static KThemeData of(BuildContext context) {
    _context = context;
    return _instance ?? KThemeData._internal();
  }

  SystemUiOverlayStyle get overlayStyle {
    return Theme.of(_context!).brightness == Brightness.light ? _lightOverLay : _darkOverLay;
  }

  ThemeData get themeData {
    return Theme.of(_context!).brightness == Brightness.light ? light : dark;
  }

  static ThemeData get light {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundL,
      primaryColor: Colors.pink[800],
      colorScheme: ThemeData.light().colorScheme.copyWith(secondary: KColors.accentColorL),
      appBarTheme: const AppBarTheme(
        color: KColors.fillContainerL,
        systemOverlayStyle: _lightOverLay,
        elevation: 2,
        actionsIconTheme: IconThemeData(color: KColors.iconL),
        iconTheme: IconThemeData(color: KColors.iconL),
      ),
      shadowColor: KColors.shadowL,
      inputDecorationTheme: inputDecorationTheme(accentColor: KColors.backgroundD),
      iconTheme: const IconThemeData(color: KColors.iconL),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowL, background: KColors.accentColorL),
      switchTheme: const SwitchThemeData(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundD,
      colorScheme: ThemeData.dark().colorScheme.copyWith(secondary: KColors.accentColorD),
      appBarTheme: const AppBarTheme(
        color: KColors.elevatedBoxD,
        systemOverlayStyle: _darkOverLay,
        elevation: 2,
        actionsIconTheme: IconThemeData(color: KColors.iconD),
      ),
      shadowColor: KColors.shadowD,
      inputDecorationTheme: inputDecorationTheme(accentColor: KColors.backgroundL),
      iconTheme: const IconThemeData(color: KColors.iconD),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowD, background: KColors.accentColorD),
    );
  }

  static ElevatedButtonThemeData elevatedBtnTheme({required Color shadow, required Color background}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(shadow),
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(background),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KHelper.cornerRadius),
          ),
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme({required Color accentColor}) {
    return InputDecorationTheme(
      border: outlineInputBorder(color: accentColor),
      disabledBorder: outlineInputBorder(color: accentColor),
      errorBorder: outlineInputBorder(color: Colors.red),
      focusedErrorBorder: outlineInputBorder(color: Colors.red),
      enabledBorder: outlineInputBorder(color: accentColor),
      focusedBorder: outlineInputBorder(color: accentColor),
    );
  }


  static OutlineInputBorder outlineInputBorder({required Color color}) => OutlineInputBorder(
        borderSide: BorderSide(width: .75, color: color),
        borderRadius: BorderRadius.circular(25),
      );

  static const SystemUiOverlayStyle _darkOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle _lightOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
