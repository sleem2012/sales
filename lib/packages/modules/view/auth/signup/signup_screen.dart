import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../di.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/widgets/country_code.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../../views/widgets/nationality/nationality_drop_down.dart';
import '../../../../../views/widgets/new_bg_img.dart';
import '../../../../../views/widgets/slugs_drop_down.dart';
import '../../../../cache/locale_storage.dart';
import '../../../../extensions.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/picker/view/dialog_picker.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../widgets/icon_button.dart';
import '../../../../widgets/pick_image_widget.dart';
import '../../../../widgets/text_field.dart';
import '../../../logic/auth/register/register_bloc.dart';
import '../../../logic/auth/register/register_state.dart';
import '../../../logic/settings/settings_bloc.dart';
import '../../../logic/settings/settings_state.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        isInputs: true,
        child: SingleChildScrollView(
          child: Center(
            child: BlocProvider(
              create: (context) => Di.registerBloc,
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  final e = RegisterBloc.of(context).emailController.text;
                  final p = RegisterBloc.of(context).passwordController.text;
                  state.maybeWhen(
                    orElse: () => null,
                    success: () => Nav.offAll(LoginScreen(email: e, password: p)),
                  );
                },
                builder: (context, state) {
                  final regBloc = RegisterBloc.of(context);
                  return KLoadingOverlay(
                    isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Hero(
                              tag: 'assets/images/Logo Only.svg',
                              child: SvgPicture.asset('assets/images/Logo Only.svg'),
                            ),
                          ),
                          Text(
                            Tr.get.create_account,
                            style: KTextStyle.of(context).title2,
                          ),
                          Text(
                            Tr.get.signup_message,
                            style: KTextStyle.of(context).title,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 25),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                PickProImageWidget(
                                  onSelect: regBloc.selectImage,
                                  hint: Tr.get.personal_photo,
                                  isAvatar: true,
                                  radius: 100,
                                  decoration: KHelper.of(context).textFieldDecoration,
                                ),
                                const SizedBox(height: 10),
                                KTextFormField(
                                  controller: regBloc.nameController,
                                  hintText: Tr.get.name,
                                  enabled: true,
                                  keyboardType: TextInputType.text,
                                  fillColor: KColors.of(context).fillColor,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.name_validation;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                KDropdownBtn<KSlugModel>(
                                  onChanged: regBloc.selectGender,
                                  items:
                                      KSlugModel.genders.map((e) => KHelper.of(context).itemView<KSlugModel>(itemText: e.translated, value: e)).toList(),
                                  title: Tr.get.gender,
                                ),
                                10.h,
                                InkWell(
                                  onTap: () {
                                    regBloc.selectDate(context);
                                  },
                                  child: KTextFormField(
                                    controller: regBloc.birthdateController,
                                    hintText: Tr.get.birthdate_title,

                                    enabled: false,
                                    autofocus: false,
                                    // validator: (String? v) {
                                    //   if (v!.isEmpty) {
                                    //     return Tr.get.field_required;
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                ),
                                10.h,
                                InkWell(
                                  onTap: () async {
                                    await KHelper.showCustomBottomSheet(
                                      isDismissible: false,
                                      AddLocationDetails(
                                        onSave: (value) {
                                          if (value != null) {
                                            regBloc.setLocationData(value);
                                            regBloc.detailedAddressController.setText(value.address);
                                            Nav.back();
                                          }
                                        },
                                        initialData: regBloc.setInitial(),
                                      ),
                                    );
                                  },
                                  child: KTextFormField(
                                    hintText: Tr.get.location_input,
                                    onTap: () {},
                                    fillColor: KColors.of(context).fillColor,
                                    enabled: false,
                                    controller: regBloc.detailedAddressController,
                                    keyboardType: TextInputType.emailAddress,
                                    suffixIcon: Icon(
                                      Icons.location_on_outlined,
                                      color: KColors.of(context).accentColor,
                                    ),
                                    validator: (value) {
                                      if (regBloc.addressIsNull) {
                                        return Tr.get.address_is_null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                10.h,
                                if (regBloc.addressIsNull) Text(Tr.get.address_is_null, style: KTextStyle.of(context).error),
                                NationalityDropDown(
                                  initValue: regBloc.selectedNationality,
                                  onChanged: (value) {
                                    regBloc.selectNationality((value?.id ?? 1), value);
                                  },
                                ),
                                10.h,
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: KTextFormField(
                                    controller: regBloc.phoneController,
                                    hintText: Tr.get.phone_number,
                                    fillColor: KColors.of(context).fillColor,
                                    enabled: true,
                                    keyboardType: TextInputType.phone,
                                    prefixIcon: CountryCodeWidget(
                                      onChanged: (p0) {
                                        regBloc.cCode = "(${p0?.dialCode ?? '+966'})".replaceAll('+', '');
                                        debugPrint('================= ${regBloc.cCode} : ');
                                      },
                                      onInit: (p0) {
                                        regBloc.cCode = "(${p0?.dialCode ?? '+966'})".replaceAll('+', '');
                                        debugPrint('================= ${regBloc.cCode} : ');
                                      },
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.phone_number_validation;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                10.h,
                                KTextFormField(
                                  hintText: Tr.get.email,
                                  controller: regBloc.emailController,
                                  fillColor: KColors.of(context).fillColor,
                                  enabled: true,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.email_validation;
                                    }
                                    return null;
                                  },
                                ),
                                10.h,
                                KTextFormField(
                                  hintText: Tr.get.password,
                                  controller: regBloc.passwordController,
                                  obscureText: regBloc.passVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  fillColor: KColors.of(context).fillColor,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.pass_validation;
                                    }
                                    return null;
                                  },
                                  suffixIcon: KIconButton(
                                    onPressed: regBloc.togglePassV,
                                    child: Icon(!regBloc.passVisible ? KHelper.visibilityOff : KHelper.visibility),
                                  ),
                                ),
                                10.h,
                                KTextFormField(
                                  hintText: Tr.get.confirm_password,
                                  obscureText: regBloc.passVisible,
                                  controller: regBloc.passwordConfirmController,
                                  keyboardType: TextInputType.visiblePassword,
                                  fillColor: KColors.of(context).fillColor,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.confirm_password_validation;
                                    }
                                    if (value != regBloc.passwordController.text) {
                                      return Tr.get.confirm_password_validation;
                                    }
                                    if (value != regBloc.passwordController.text) {
                                      return Tr.get.confirm_password_matching_validation;
                                    }
                                    return null;
                                  },
                                  suffixIcon: KIconButton(
                                    onPressed: regBloc.togglePassV,
                                    child: Icon(!regBloc.passVisible ? KHelper.visibilityOff : KHelper.visibility),
                                  ),
                                ),
                                10.h,
                                Row(
                                  children: [
                                    Checkbox(
                                      value: regBloc.termsChecked,
                                      onChanged: (value) {
                                        regBloc.checkTerms(value!);
                                      },
                                    ),
                                    BlocBuilder<SettingsBloc, SettingsState>(
                                      builder: (context, state) {
                                        return InkWell(
                                          onTap: () async {
                                            final url = KStorage.i.getSettings?.data?.first.termsContent?.vendor;
                                            if (url != null) {
                                              await launchUrlString(
                                                url,
                                              );
                                            }
                                          },
                                          child: Text(
                                            Tr.get.terms_and_conditions,
                                            style: const TextStyle(decoration: TextDecoration.underline),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: regBloc.privacyChecked,
                                      onChanged: (value) {
                                        regBloc.checkPrivacy(value!);
                                      },
                                    ),
                                    BlocBuilder<SettingsBloc, SettingsState>(
                                      builder: (context, state) {
                                        return InkWell(
                                          onTap: () async {
                                            final String? url = KStorage.i.getSettings?.data?.first.privacyContent?.vendor;
                                            debugPrint('================= $url : ');
                                            if (url != null) {
                                              await launchUrlString(
                                                url,
                                              );
                                            }
                                          },
                                          child: Text(
                                            Tr.get.privacy_policy,
                                            style: const TextStyle(decoration: TextDecoration.underline),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: regBloc.contractChecked,
                                      onChanged: (value) {
                                        regBloc.checkContract(value!);
                                      },
                                    ),
                                    Text(
                                      Tr.get.digital_contract,
                                      style: const TextStyle(decoration: TextDecoration.underline),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 40),
                                KButton(
                                  title: Tr.get.submit,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      regBloc.register();
                                    }
                                  },
                                  height: 45,
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
