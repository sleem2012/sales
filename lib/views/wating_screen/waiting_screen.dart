import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/auth/user_info/user_info_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/modules/view/auth/logout/logout_with_another_email.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../main_screen/main_screen.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserInfoBloc, UserInfoState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (userModel) {
              if (userModel.data?.type?.id != 13) {
                NavEnforcerBloc.of(context).checkUser(destination: const MainNavigationView());
              }
            },
          );
        },
        child: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              await UserInfoBloc.of(context).getUserInfo();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/Logo Only.svg'),
                  const SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   Tr.get.sorry,
                  //   style: KTextStyle.of(context).names,
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset('assets/images/acc_added_success.svg'),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    Tr.get.waiting_add_hint,
                    style: KTextStyle.of(context).names,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    Tr.get.review_message,
                    style: KTextStyle.of(context).body2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const LoginWithAnotherEmail()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
