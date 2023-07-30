import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/main_view/main_view_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/search_company/search_company_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/chat/view/conversation_list.dart';
import '../../packages/modules/view/notifications/view/notifications_list.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/widgets/icon_button.dart';
import '../genral_search/general_search_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile/profile_screen.dart';
import '../transactions/transactions.dart';
import '../widgets/action_dialog.dart';
import '../widgets/appbar.dart';
import '../widgets/general_search_button.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/slug_drop_down.dart';
import '../widgets/speed_dial.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  @override
  void initState() {
    // if (!kDebugMode) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showMaterialBanner(
    //
    //       const MaterialBanner(
    //         surfaceTintColor:Colors.transparent ,
    //         content: AdBanner(),
    //         leadingPadding: EdgeInsets.zero,
    //         padding: EdgeInsets.zero,
    //         backgroundColor: Colors.transparent,
    //         leading: SizedBox(),
    //         actions: [SizedBox()],
    //       ),
    //     );
    //   });
    // }
    super.initState();
    NavEnforcerBloc.of(context).checkUser(destination: const MainNavpages());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: KLoadingOverlay(isLoading: true),
    );
  }
}

class CompanyLockedView extends StatelessWidget {
  const CompanyLockedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${Tr.get.company_is_Locked} : ${UserInfoBloc.of(context).user?.data?.userCompany?.lockReason ?? UserInfoBloc.of(context).user?.data?.companyBranch?.company?.lockReason}',),
            TextButton(
              onPressed: () {
                Nav.offAll(const MainNavpages());
              },
              child: Text(Tr.get.skip),
            )
          ],
        ),
      ),
    );
  }
}

class MainNavpages extends StatefulWidget {
  const MainNavpages({Key? key}) : super(key: key);

  @override
  State<MainNavpages> createState() => _MainNavpagesState();
}

class _MainNavpagesState extends State<MainNavpages> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewBloc, MainViewState>(
      builder: (context, state) {
        final user = KStorage.i.getUserInfo?.data;
        return WillPopScope(
          onWillPop: () async {
            ActionDialog(
              title: Tr.get.exit_question,
              approveAction: Tr.get.yes_message,
              cancelAction: Tr.get.no_message,
              onApproveClick: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
              onCancelClick: () {
                Navigator.pop(context);
              },
            ).show<void>(context);
            return false;
          },
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            appBar:  KAppBar(actions: [
               const GeneralSearchButton(),
              KIconButton(
                child: const Icon(KHelper.notifications, size: KHelper.iconSize),
                onPressed: () {
                  MainViewBloc.of(context).navTaped(KStorage.i.getUserInfo?.data?.type?.id == 1 ? 3 : 4);
                },
              ),
            ],),
            body: BgImg(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: PageView(
                  controller: MainViewBloc.of(context).pageCtrl,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const HomeScreen(),
                    if (user?.type?.id != 1) const TransactionScreen(),
                    const ConversationView(),
                    const ProfileScreen(),
                    const NotificationsList(),
                    GeneralSearchScreen(
                      type: SearchCompanyBloc.of(context).searchType ?? KSlugModel(translated: '', slug: ''),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: (user?.type?.id != 1 && user?.type?.id != 16) ? SpeedDialWidget() : const SizedBox(),
            floatingActionButtonLocation: user?.type?.id != 1 ? FloatingActionButtonLocation.centerDocked : FloatingActionButtonLocation.startTop,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              height: 50,
              icons: MainViewBloc.of(context).navItems,
              activeIndex: state.index,
              shadow: Shadow(color: KColors.of(context).shadow, blurRadius: 10),
              backgroundColor: KColors.of(context).elevated.withOpacity(1),
              gapLocation: (KStorage.i.getUserInfo?.data?.type?.id != 1) ? GapLocation.center : GapLocation.none,
              notchSmoothness: NotchSmoothness.softEdge,
              onTap: (p0) {
                MainViewBloc.of(context).navTaped(p0);
              },
              activeColor: KColors.of(context).selected,
              inactiveColor: KColors.of(context).accentColor,
            ),
          ),
        );
      },
    );
  }
}
