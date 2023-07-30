import 'package:flutter/material.dart';

import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../logic/theme/theme_cubit.dart';
import '../../../../views/widgets/new_bg_img.dart';
import '../../../cache/locale_storage.dart';
import '../../../extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../widgets/custom_button.dart';
import '../../logic/currencies/currencies_bloc.dart';
import '../../logic/settings/settings_bloc.dart';
import '../currencies/currency_drop.dart';
import '../language/lang_dropdown.dart';
import 'on_boarding_screen.dart';

class ChooseLangScreen extends StatelessWidget {
  const ChooseLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/select_lang_asset.png",
                fit: BoxFit.cover,
                width: KHelper.width,
                height: KHelper.height - 240,
              ),
              SizedBox(
                height: 240,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      10.h,
                      SizedBox(
                        height: 40,
                        child: Text(
                          Tr.get.started,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: KColors.of(context).accentColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      10.h,
                      Column(
                        children: [
                          LanguageDropdown(
                            onSelect: (val) {
                              CurrenciesBloc.of(context).getCurrencies();
                            },
                          ),
                          const SizedBox(height: 5),
                          CurrenciesDropdown(
                            onSelect: (val) {
                              CurrenciesBloc.of(context).selectCurrency(val!);
                            },
                          ),
                        ],
                      ),
                      15.h,
                      KButton(
                        title: Tr.get.go,
                        height: 45,
                        onPressed: () {
                          if (KStorage.i.getLang != null && KStorage.i.getcurrencyId != null) {
                            ThemeBloc.of(context).updateLocale(KStorage.i.getLang);
                            Nav.offAll(const OnBoarding());
                            SettingsBloc.of(context).getSettings();
                          } else if (KStorage.i.getcurrencyId != null || KStorage.i.getLang != null) {
                            KHelper.showSnackBar(Tr.get.general_validation);
                          }
                        },
                      ),
                      20.h,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
