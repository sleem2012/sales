import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../logic/main_view/main_view_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/modules/view/auth/logout/logout_with_another_email.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/icon_button.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? needsPop, showAct;
  final bool isDUI;

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;

  const KAppBar({Key? key, this.needsPop = false, this.title, this.showAct = true, this.titleWidget, this.actions, this.isDUI = false}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: AppBar(
        centerTitle: true,
        title: title != null
            ? Text(title!, style: KTextStyle.of(context).body)
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/Logo Only.svg', height: 24, width: 24),
                  const SizedBox(width: 10),
                  Text('FORAll', style: TextStyle(fontSize: 20, color: KColors.of(context).accentColor)),
                ],
              ),
        titleTextStyle: KTextStyle.of(context).headers,
        actions: actions ??
            [
              if (showAct!) ...[
                KIconButton(
                  child: const Icon(KHelper.notifications, size: KHelper.iconSize),
                  onPressed: () {
                    if (needsPop!) Nav.back();
                    MainViewBloc.of(context).navTaped(5);
                  },
                ),
                if (isDUI) const LogoutWithAnotherEmailButton(),
              ] else
                const LogoutWithAnotherEmailButton(),
            ],
      ),
    );
  }
}

// class KAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool? needsPop;
//   final bool isMainScreen;
//   final bool isDUI;
//   final bool showAct;
//   final String? title;

//   const KAppBar({Key? key, this.needsPop = false, this.title, this.isMainScreen = false, this.isDUI = false, this.showAct = false}) : super(key: key);

//   @override
//   Size get preferredSize => const Size.fromHeight(60);

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: 'appBar',
//       child: AppBar(
//         centerTitle: false,
//         automaticallyImplyLeading: isMainScreen ? false : true,
//         elevation: 1,
//         title: Row(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isDUI) const LogoutWithAnotherEmailButton(),
//             if (isMainScreen) ...[
//               const GeneralSearchButton(),
//               KIconButton(
//                 child: const Icon(KHelper.notifications, size: KHelper.iconSize),
//                 onPressed: () {
//                   if (needsPop!) Nav.back();
//                   MainViewBloc.of(context).navTaped(KStorage.i.getUserInfo?.data?.type?.id == 1 ? 3 : 4);
//                 },
//               ),
//             ]
//           ],
//         ),
//         titleTextStyle: KTextStyle.of(context).headers,
//         actions: [
//           title != null
//               ? Text(title!, style: KTextStyle.of(context).body)
//               : Row(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset('assets/images/Logo Only.svg', height: 40, width: 40),
//                     // const SizedBox(width: 10),
//                     Text(
//                       'Forall',
//                       style: TextStyle(fontSize: 20, color: KColors.of(context).accentColor),
//                     ),
//                     const SizedBox(width: 10),
//                   ],
//                 )
//         ],
//       ),
//     );
//   }
// }
