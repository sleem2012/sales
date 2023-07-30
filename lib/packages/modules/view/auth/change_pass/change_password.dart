import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../di.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/widgets/appbar.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../../views/widgets/new_bg_img.dart';
import '../../../../../views/widgets/on_success_view.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/icon_button.dart';
import '../../../../widgets/text_field.dart';
import '../../../logic/auth/change_pass/change_pass_cubit.dart';
import '../../../logic/auth/change_pass/change_pass_state.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.changePass,
      child: BlocConsumer<ChangePassCubit, ChangePassState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              Nav.replace(OnSuccessView(msg: Tr.get.pass_change_success));
            },
          );
        },
        builder: (context, state) {
          final pass = ChangePassCubit.of(context);
          return Scaffold(
            appBar: KAppBar(needsPop: true, title: Tr.get.change_password),
            extendBodyBehindAppBar: true,
            body: BgImg(
              child: Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: KLoadingOverlay(
                    isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Center(
                              child: SvgPicture.asset(
                                'assets/images/pass_lock.svg',
                                width: KHelper.width * .45,
                              ),
                            ),
                            const SizedBox(height: 50),
                            KTextFormField(
                              obscureText: pass.isVisible,
                              controller: pass.currentPassController,
                              hintText: Tr.get.current_password,
                              suffixIcon: KIconButton(
                                radius: 10,
                                child: Icon(pass.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                onPressed: () {
                                  pass.togglePassV();
                                },
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.pass_validation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            KTextFormField(
                              obscureText: pass.isVisible,
                              controller: pass.newPassController,
                              hintText: Tr.get.new_pass,
                              suffixIcon: KIconButton(
                                radius: 10,
                                child: Icon(pass.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                onPressed: () {
                                  pass.togglePassV();
                                },
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.pass_validation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            KTextFormField(
                              obscureText: pass.isVisible,
                              controller: pass.confirmPassController,
                              hintText: Tr.get.confirm_password,
                              suffixIcon: KIconButton(
                                radius: 10,
                                child: Icon(pass.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                onPressed: () {
                                  pass.togglePassV();
                                },
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.confirm_password_validation;
                                }
                                if (value != pass.newPassController.text) {
                                  return Tr.get.confirm_password_matching_validation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 50),
                            KButton(
                              title: Tr.get.change_password,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  pass.changePass();
                                }
                              },
                              width: KHelper.width * .7,
                            )
                          ],
                        ),
                      ),
                    ),
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
