import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../di.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../../views/widgets/new_bg_img.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/text_field.dart';
import '../../../logic/auth/forget_pass/forget_pass_bloc.dart';
import '../../../logic/auth/forget_pass/forget_pass_state.dart';
import '../pin_code/pin_code_screen.dart';
import '../reset_code/reset_pass_screen.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        isInputs: true,
        child: Center(
          child: BlocProvider(
            create: (context) => Di.forgetPasswordBloc,
            child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    Nav.replace(PinCodeScreen(email: emailController.text, destination: ResetPassScreen()));
                  },
                );
              },
              builder: (context, state) {
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SvgPicture.asset('assets/images/Logo Only.svg'),
                        ),
                        Text(
                          Tr.get.forget_password,
                          style: TextStyle(color: KColors.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: KHelper.height * .07),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              KTextFormField(
                                hintText: Tr.get.email,
                                controller: emailController,
                                enabled: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.please_enter_your_email;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: KHelper.height * .02),
                              Padding(
                                padding: EdgeInsets.all(KHelper.width * .04),
                                child: KButton(
                                  title: Tr.get.send_code,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ForgetPasswordBloc.of(context).sendCode(email: emailController.text);

                                      FocusManager.instance.primaryFocus?.unfocus();
                                    }
                                  },
                                  height: 45,
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
      ),
    );
  }
}
