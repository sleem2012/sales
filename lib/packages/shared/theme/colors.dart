import 'package:flutter/material.dart';

import 'text_theme.dart';

abstract class KColors {
  static ColorsGetter of(BuildContext context) => ColorsGetter.of(context);

  //Light
  static const Color textD = KTextStyle.mainD;
  static const Color textL = KTextStyle.mainL;

  static const Color backgroundL = Color(0xfff8f8f8);
  static const Color elevatedBoxL = Color(0xFFffffff);
  static const Color navBarL = Color(0xFFF8F8F8);
  static const Color actionBTNL = Color(0xFF05B646);
  static const Color inActionBTNL = Color(0xFF8BD8D7);
  static const Color fabL = Color(0xFF45C0BE);
  static const Color iconL = Color(0xFF00ADB5);
  static const Color selectedIconL = Color(0xFF222134);
  static const Color errorL = Colors.red;
  static const Color shadowL = Color(0x20000000);
  static const Color cursorL = Color(0xFFBE0202);
  static const Color accentColorL = Color(0xFF00ADB5);
  static const Color lightFiled = Color(0xfff8f8f8);
  static const Color linearOne = Color(0xff00ADB5);
  static const Color linearTwo = Color(0xFFBDE4E7);
  static const Color transactionCard = Color(0xFF406478);
  static const Color statusBarL = Color(0xffCAECEE);

  //Dark
  static const Color backgroundD = Color(0xff2F2E41);
  static const Color elevatedBoxD = Color(0xFF223C4A);
  static const Color darkField = Color(0xFF406478);
  static const Color fillContainerD = Color(0xFF223C4A);
  static const Color navBarD = Color(0xFF222134);
  static const Color actionBTND = Color(0xFF05B646);
  static const Color inActionBTND = Color(0xFF8BD8D7);
  static const Color fabD = Color(0xFF45C0BE);
  static const Color iconD = Color(0xFF45C0BE);
  static const Color selectedIconD = Colors.white;
  static const Color errorD = Colors.red;
  static const Color shadowD = Color(0x20000000);
  static const Color cursorD = Color(0xFFBE0202);
  static const Color accentColorD = Color(0xFF00ADB5);
  static const Color fillContainerL = Colors.white;
  static const Color statusBarD = Color(0xFF45616F);
}

class ColorsGetter extends KColors {
  static BuildContext? _context;
  static ColorsGetter? _instance;

  ColorsGetter._internal() {
    _instance = this;
  }

  static ColorsGetter of(BuildContext context) {
    _context = context;
    return _instance ?? ColorsGetter._internal();
  }

  //Getters
  Color get error => KColors.errorD;

  Color get actionBTN => const Color(0xFF05B646);

  Color get statusBar {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.statusBarD : KColors.statusBarL;
  }

  Color get freeShipping {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.inActionBTNL : KColors.inActionBTND;
  }

  Color get navBar {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.navBarD : KColors.navBarL;
  }

  Color get background {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.fillContainerD : Colors.white;
  }

  Color get elevatedBox {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.elevatedBoxL : KColors.elevatedBoxD;
  }

  Color get shadow {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.shadowL : KColors.shadowD;
  }

  Color get cursor => KColors.cursorD;

  Color get reBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundD : KColors.backgroundL;
  }

  Color get card {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.accentColorL : KColors.elevatedBoxD;
  }

  Color get border {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundD.withOpacity(.2) : KColors.backgroundL.withOpacity(.2);
  }

  Color get trackColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.actionBTND : KColors.actionBTND;
  }

  Color get thumbColor => Colors.white;

  Color get activeIcons {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.iconL : KColors.iconD;
  }

  Color get selected {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.selectedIconL : KColors.selectedIconD;
  }

  Color get fabBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.fabL : KColors.fabD;
  }

  Color get accentColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.accentColorL : KColors.accentColorD;
  }

  Color get accentBlackColor {
    return Theme.of(_context!).brightness == Brightness.light ? Colors.black : KColors.accentColorD;
  }

  Color get fieldColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.lightFiled : KColors.darkField;
  }

  Color get fillColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundL : KColors.darkField;
  }

  Color get fillContainer {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.fillContainerL : KColors.fillContainerD;
  }

  Color get elevated {
    return Theme.of(_context!).brightness == Brightness.light ? Colors.white : KColors.fillContainerD;
  }

  Color get transactionCard {
    return Theme.of(_context!).brightness == Brightness.light ? Colors.white : KColors.transactionCard;
  }

  Color get icons {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.accentColorL : KColors.accentColorD;
  }
}
