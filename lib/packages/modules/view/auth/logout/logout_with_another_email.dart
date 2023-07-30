import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../logic/auth/logout/logout_bloc.dart';
import '../../../logic/auth/logout/logout_state.dart';

class LoginWithAnotherEmail extends StatelessWidget {
  const LoginWithAnotherEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Nav.replace(const Wrapper());
          },
        );
      },
      builder: (context, state) {
        return TextButton(
          onPressed: LogoutBloc.of(context).logout,
          child: Text(
            state.maybeWhen(
              orElse: () => Tr.get.login_with_another_email,
              loading: () => Tr.get.loading,
            ),
            style: KTextStyle.of(context).title,
          ),
        );
      },
    );
  }
}

class LogoutWithAnotherEmailButton extends StatelessWidget {
  const LogoutWithAnotherEmailButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Nav.replace(const Wrapper());
          },
        );
      },
      builder: (context, state) {
        return RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: state.maybeWhen(
              orElse: () => Icon(Icons.exit_to_app, color: KColors.of(context).accentColor),
              loading: () => const CircularProgressIndicator(),
            ),
            onPressed: LogoutBloc.of(context).logout,
          ),
        );
      },
    );
  }
}
