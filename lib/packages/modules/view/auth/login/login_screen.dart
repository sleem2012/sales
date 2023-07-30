import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../di.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/main_screen/main_screen.dart';
import '../../../../../views/widgets/action_dialog.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../../views/widgets/new_bg_img.dart';
import '../../../../cache/locale_storage.dart';
import '../../../../shared/error/error_422_model.dart';
import '../../../../shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/icon_button.dart';
import '../../../../widgets/text_field.dart';
import '../../../logic/auth/login/login_bloc.dart';
import '../../../logic/auth/login/login_state.dart';
import '../forget_pass/forget_pass_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? email, password;

  const LoginScreen({Key? key, this.email, this.password}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController email_ctrl;
  late TextEditingController password_ctrl;

  @override
  void initState() {
    super.initState();
    String defaultMail = KStorage.i.getDefaultMail ?? '';

    email_ctrl = TextEditingController(text: widget.email ?? (defaultMail.isNotNullAndNotEmpty ? defaultMail : ''));
    password_ctrl = TextEditingController(text: widget.password ?? '');
  }

  String? error422Text<T>(state, String key) {
    KFailure? failure = state?.maybeWhen(orElse: () => null, error: (value) => value);
    Error422Model? error422model = failure?.maybeWhen(orElse: () => null, error422: (error422model) => error422model);
    return error422model?.errors[key]?.first;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ActionDialog(
          title: Tr.get.exit_question,
          approveAction: Tr.get.yes_message,
          cancelAction: Tr.get.no_message,
          onApproveClick: () {
            Nav.back();
          },
          onCancelClick: () {
            Nav.back();
          },
        ).show<void>(context);
        return false;
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => Di.loginBloc,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (userModel) async {
                  await Di.reset(context);
                  Nav.offAll(const MainNavigationView());
                },
              );
            },
            builder: (context, state) {
              final login = LoginBloc.of(context);
              return KLoadingOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                child: BgImg(
                  isInputs: true,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: KHelper.hScaffoldPadding),
                        child: Column(
                          children: [
                            SizedBox(
                              height: KHelper.height / 6,
                            ),
                            Text(
                              Tr.get.welcome_back,
                              style: KTextStyle.of(context).title2,
                            ),
                            Text(
                              Tr.get.login_message,
                              style: KTextStyle.of(context).title,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Hero(
                                tag: 'assets/images/Logo Only.svg',
                                child: SvgPicture.asset('assets/images/Logo Only.svg'),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  KTextFormField(
                                    controller: email_ctrl,
                                    hintText: Tr.get.email,
                                    enabled: true,
                                    errorText: error422Text(state, 'email'),
                                    keyboardType: TextInputType.emailAddress,
                                    fillColor: KColors.of(context).fillColor,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.email_validation;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: KHelper.height * .025),
                                  KTextFormField(
                                    obscureText: login.isVisible,
                                    controller: password_ctrl,
                                    hintText: Tr.get.password,
                                    errorText: error422Text(state, 'password'),
                                    keyboardType: TextInputType.visiblePassword,
                                    fillColor: KColors.of(context).fillColor,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.pass_validation;
                                      }
                                      return null;
                                    },
                                    suffixIcon: KIconButton(
                                      child: Icon(login.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                      onPressed: () {
                                        login.togglePassV();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Nav.to(ForgetPassScreen());
                                      },
                                      child: Text(
                                        Tr.get.forget_pass_question,
                                        style: KTextStyle.of(context).title.copyWith(color: KColors.of(context).reBackground),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: KHelper.height * .05),
                                  KButton(
                                    title: Tr.get.login,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        LoginBloc.of(context).login(email: email_ctrl.text, password: password_ctrl.text);
                                      }
                                    },
                                    height: KHelper.height * 0.05,
                                    width: KHelper.width * 5,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () {
                                        Nav.to(const SignUpScreen());
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: Tr.get.dont_have_acc,
                                              style: KTextStyle.of(context).title.copyWith(color: KColors.of(context).reBackground),
                                            ),
                                            TextSpan(
                                              text: Tr.get.sign_up,
                                              style: TextStyle(decoration: TextDecoration.underline, color: KColors.of(context).reBackground),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
