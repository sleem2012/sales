import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../extensions.dart';
import '../../multi_select_dialog/index.dart';
import '../localization/trans.dart';
import '../picker/data/country_search_model/address_result.dart';
import '../picker/view/map.dart';
import 'colors.dart';
import 'text_theme.dart';

String get dummyNetLogo => 'https://forall.sa/assets/image/no-image.jpg';

String get dummyNetImg => 'https://forall.sa/assets/image/bg.jpg';

abstract class KHelper {
  static KHelperGetters of(BuildContext context) {
    return KHelperGetters.of(context);
  }

  /// Icons Data =================*
  static const IconData activity = Icons.show_chart_outlined;
  static const IconData dashBoard = Icons.dashboard;
  static const IconData list = Icons.list_outlined;
  static const IconData store = Icons.storefront_outlined;
  static const IconData add = Icons.add_outlined;
  static const IconData person = Icons.person_outlined;
  static const IconData check = Icons.check_circle_outlined;
  static const IconData cancel = Icons.cancel_outlined;
  static const IconData delete = Icons.delete_forever_rounded;
  static const IconData chats = Icons.chat_outlined;
  static const IconData moreHoriz = Icons.more_horiz_outlined;
  static const IconData notifications = Icons.notifications_none_outlined;
  static const IconData expand = Icons.keyboard_arrow_down_outlined;
  static const IconData jobs = Icons.add_business_outlined;
  static const IconData expandSided = Icons.keyboard_arrow_right_outlined;
  static const IconData phone = Icons.phone_android_outlined;
  static const IconData email = Icons.email_outlined;
  static const IconData location = Icons.location_pin;
  static const IconData branches = Icons.map_outlined;
  static const IconData payment = Icons.payment_outlined;
  static const IconData subscription = Icons.payments_outlined;
  static const IconData lang = Icons.language_outlined;
  static const IconData passworrd = Icons.key_outlined;
  static const IconData report = Icons.report_outlined;
  static const IconData theme = Icons.dark_mode_outlined;
  static const IconData terms = Icons.file_copy_outlined;
  static const IconData privacyPolicy = Icons.privacy_tip_outlined;
  static const IconData contract = Icons.file_copy_outlined;
  static const IconData help = Icons.help_outline;
  static const IconData visibility = Icons.visibility_outlined;
  static const IconData visibilityOff = Icons.visibility_off_outlined;
  static const IconData logout = Icons.exit_to_app_outlined;
  static const IconData home = Icons.home_outlined;
  static const IconData money = Icons.attach_money_outlined;
  static const IconData chat = Icons.message_outlined;
  static const IconData share = Icons.share_outlined;
  static const IconData search = Icons.search;
  static const IconData social = Icons.social_distance;
  static const IconData deactivate = Icons.person_remove_outlined;

  /// Constants =================*
  static const double cornerRadius = 8.0;
  static const double hPadding = 12.0;
  static const double hScaffoldPadding = 30.0;
  static const double iconSize = 20.0;
  static const double iconSize2 = 15.0;

  static double get height {
    return MediaQuery.of(Nav.navigator.currentContext!).size.height;
  }

  static double get width {
    return MediaQuery.of(Nav.navigator.currentContext!).size.width;
  }

  static Future<T?> showCustomDialog<T>({required Widget child, EdgeInsets? padding}) {
    return showDialog<T>(
      context: Nav.navigator.currentContext!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: padding ?? EdgeInsets.zero,
          child: child,
        );
      },
    );
  }

  static Future<T?> showCustomBottomSheet<T>(Widget child, {bool? isScrollControlled, BuildContext? widgetContext, bool? isDismissible}) async {
    return showModalBottomSheet<T>(
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: Nav.navigator.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (widgetContext) => DecoratedBox(
        decoration: BoxDecoration(color: of(Nav.navigator.currentContext!).filled.color),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: DecoratedBox(decoration: of(Nav.navigator.currentContext!).elevatedBox, child: const SizedBox(height: 8, width: 80)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  primary: true,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(widgetContext).viewInsets.bottom + 20, top: 30),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<T?> showCustomBottomSheetWTIntrinsic<T>(Widget child, {bool? isScrollControlled, BuildContext? widgetContext}) async {
    return showModalBottomSheet<T>(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: Nav.navigator.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (widgetContext) => DecoratedBox(
        decoration: of(Nav.navigator.currentContext!).filled,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DecoratedBox(decoration: of(Nav.navigator.currentContext!).elevatedBox, child: const SizedBox(height: 8, width: 80)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(widgetContext).viewInsets.bottom + 20, top: 30),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showSnackBar(String msg, {String? title, bool? isTop, Widget? icon, Color? backgroundColor, Color? barColor}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      (title ?? '').capitalized,
      msg.capitalizeFirst ?? msg,
      snackPosition: isTop ?? true ? SnackPosition.TOP : SnackPosition.BOTTOM,
      barBlur: 10.0,
      //backgroundColor: Colors.black.withOpacity(.6),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      duration: const Duration(seconds: 6),
      //padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 8),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 8,
      // icon: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     DecoratedBox(
      //       decoration: BoxDecoration(color: barColor, borderRadius: const BorderRadiusDirectional.horizontal(start: Radius.circular(8))),
      //       child: const SizedBox(width: 10, height: 80),
      //     ),
      //     if (icon != null) icon,
      //     const SizedBox(width: 10),
      //   ],
      // ),
      backgroundColor: backgroundColor ?? KColors.of(Nav.navigator.currentContext!).reBackground,
      //colorText: Colors.white,

      icon: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: barColor, borderRadius: const BorderRadiusDirectional.horizontal(start: Radius.circular(8))),
              child: const SizedBox(width: 10, height: 90),
            ),
            const SizedBox(width: 8),
            if (icon != null) icon,
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }

  static String apiDateFormatter(DateTime date) {
    return DateFormat('yyyy-MM-dd kk:mm').format(date);
  }

  static Future<AddressResult?> showMaps(BuildContext context, {Position? initLocation}) async {
    return await showGoogleMapLocationPicker(
      pinWidget: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      pinColor: Colors.blue,
      context: context,
      addressPlaceHolder: 'move_the_map',
      addressTitle: 'single_address',
      appBarTitle: Tr.get.choose_location,
      confirmButtonColor: KColors.of(context).accentColor,
      confirmButtonText: Tr.get.confirm_location,
      confirmButtonTextColor: Colors.white,
      country: "SA",
      apiKey: 'AIzaSyA4PY3RYKRShU07E-8rxSKnBMHY5UNUDjY',
      language: Tr.get.localeName,
      searchHint: Tr.get.search_for_location,
      initialLocation: LatLng(initLocation?.latitude ?? 33.0515261234, initLocation?.longitude ?? 31.1952702387),
    );
  }
}

class KHelperGetters {
  static BuildContext? _context;
  static KHelperGetters? _instance;

  KHelperGetters._internal() {
    _instance = this;
  }

  static KHelperGetters of(BuildContext context) {
    _context = context;
    return _instance ?? KHelperGetters._internal();
  }

  BoxDecoration get shimmerBox {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox.withOpacity(.2),
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
    );
  }

  BoxDecoration get elevatedBox {
    return BoxDecoration(
      color: KColors.of(_context!).background,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
    );
  }

  BoxDecoration get roundedFields {
    return BoxDecoration(
      color: KColors.of(_context!).background,
      borderRadius: BorderRadius.circular(22),
    );
  }

  BoxDecoration get fillContainer {
    return BoxDecoration(
      color: KColors.of(_context!).fillContainer,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 6.0, offset: const Offset(0, 3), color: KColors.of(_context!).shadow),
      ],
    );
  }

  Border get eBorder => Border.all(color: KColors.of(_context!).error, width: 1);

  BoxDecoration get msgBubble {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 2.0, offset: const Offset(0, 2), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get outLined {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: KColors.of(_context!).background, width: 1),
    );
  }

  BoxDecoration get textFieldDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: KColors.of(_context!).reBackground, width: 1),
    );
  }

  BoxDecoration get filled {
    return BoxDecoration(
      color: KColors.of(_context!).fillColor,
      borderRadius: BorderRadius.circular(22),
    );
  }

  BoxDecoration get errorBorder {
    return BoxDecoration(
      color: KColors.of(_context!).fillColor,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: KColors.of(_context!).error, width: 1),
    );
  }

  BoxDecoration get freeShipping {
    return BoxDecoration(
      color: KColors.of(_context!).freeShipping,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 6.0, offset: const Offset(0, 3), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get outlineCircle {
    return BoxDecoration(
      border: Border.all(color: KColors.of(_context!).accentColor, width: 1),
      shape: BoxShape.circle,
    );
  }

  BoxDecoration circle(Color color) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  BoxDecoration get badge {
    return const BoxDecoration(color: Colors.red, shape: BoxShape.circle);
  }

  BoxDecoration get transactionCard {
    return BoxDecoration(
      color: KColors.of(_context!).transactionCard,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(
          blurRadius: 6.0,
          offset: const Offset(0, 3),
          color: KColors.of(_context!).shadow,
        ),
      ],
    );
  }

  DropdownMenuItem<T> dropdownItem<T>({required String itemText, required T value}) {
    return DropdownMenuItem<T>(
      value: value,
      child: Center(
        child: Text(
          itemText,
          style: KTextStyle.of(_context!).body,
        ),
      ),
    );
  }

  MultiSelectorItem<T> itemView<T>({required String itemText, required T value, Widget? icon}) {
    return MultiSelectorItem<T>(
      value: value,
      searchValue: itemText,
      icon: icon,
      child: Text(itemText, style: KTextStyle.of(_context!).body, overflow: TextOverflow.ellipsis),
    );
  }
}
