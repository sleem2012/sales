import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../di.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../../views/widgets/on_success_view.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/text_field.dart';
import '../../../logic/auth/reset_pass/reset_pass_bloc.dart';
import '../../../logic/auth/reset_pass/reset_pass_state.dart';
import '../login/login_screen.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextEditingController _confirmController = TextEditingController();
  static final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => Di.resetPasswordBloc,
          child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () => Nav.to(OnSuccessView(msg: Tr.get.pass_change_success, destination: const LoginScreen())),
              );
            },
            builder: (context, state) {
              return KLoadingOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/Logo Only.svg'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          Tr.get.reset_password,
                          style: TextStyle(color: KColors.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SvgPicture.asset('assets/images/login_img.svg'),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            KTextFormField(
                              hintText: Tr.get.new_pass,
                              controller: _passController,
                              enabled: true,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: KHelper.height * .02),
                            KTextFormField(
                              hintText: Tr.get.confirm_password,
                              controller: _confirmController,
                              enabled: true,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            Padding(
                              padding: EdgeInsets.all(KHelper.width * .04),
                              child: KButton(
                                title: Tr.get.change_password,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ResetPasswordBloc.of(context).reset(password: _passController.text, passwordConf: _confirmController.text);
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                },
                                height: KHelper.height * 0.05,
                                width: KHelper.width * 5,
                              ),
                            ),
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
    );
  }
}
