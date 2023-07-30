import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../di.dart';
import '../../logic/auth/update_user/update_user_bloc.dart';
import '../../logic/auth/update_user/update_user_state.dart';
import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/auth/user_info/user_info_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/theme/theme_cubit.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/modules/logic/auth/logout/logout_bloc.dart';
import '../../packages/modules/logic/auth/logout/logout_state.dart';
import '../../packages/modules/view/auth/change_pass/change_password.dart';
import '../../packages/modules/view/auth/login/login_screen.dart';
import '../../packages/modules/view/branches/branches_list.dart';
import '../../packages/payment/view/payment_view.dart';
import '../../packages/shared/api_client/endpoints.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/icon_button.dart';
import '../../packages/widgets/pdf_viewer.dart';
import '../../packages/widgets/web_view.dart';
import '../widgets/action_dialog.dart';
import '../widgets/theme_toggle_btn.dart';
import 'profile_widgets.dart';
import 'update_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await UserInfoBloc.of(context).getUserInfo();
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120).copyWith(left: 8, right: 8),
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            final user = UserInfoBloc.of(context).user;
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      user?.data?.image?.s128px?.toString() ?? dummyNetImg,
                    ),
                  ),
                  title: Text(
                    "${user?.data?.name}",
                    style: KTextStyle.of(context).title,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${Tr.get.your_id.toString()} ${user?.data?.id.toString()}", style: KTextStyle.of(context).body2),
                      if (user?.data?.alternative_id != null)
                        Text("${Tr.get.employee_code.toString()}: ${user?.data?.alternative_id.toString()}", style: KTextStyle.of(context).tilePropsValues),
                    ],
                  ),
                  trailing: KIconButton(
                    child: const Icon(Icons.edit),
                    onPressed: () {
                      Nav.to(const UpdateProfile());
                    },
                  ),
                ),
                // Card(
                //   margin: EdgeInsets.zero,
                //   elevation: 5,
                //   color: KColors.of(context).fillContainer,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 5),
                //     child: ProfileTile(
                //         leading: KHelper.person,
                //         title: '${Tr.get.your_balance}:',
                //         traling: Text('${user?.data?.earning.toString()}',
                //             style: KTextStyle.of(context).body2)),
                //   ),
                // ),
                ProfileSectionTitle(title: Tr.get.my_account),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).fillContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        ProfileTile(
                          leading: KHelper.phone,
                          title: Tr.get.phone_number,
                          traling: Text(
                            '${user?.data?.mobile?.replaceAll(RegExp('[^0-9]'), '')}',
                            style: KTextStyle.of(context).body3,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        ProfileTile(
                          leading: KHelper.email,
                          title: Tr.get.business_email,
                          traling: Text('${user?.data?.email}', style: KTextStyle.of(context).body3),
                        ),
                        ProfileTile(
                          leading: KHelper.location,
                          title: Tr.get.region,
                          traling: Text(
                            '${user?.data?.address?.cityId?.countryId?.name?.value} , ${user?.data?.address?.cityId?.name?.value}',
                            style: KTextStyle.of(context).body3,
                          ),
                        ),
                        ProfileTile(
                          leading: KHelper.list,
                          title: Tr.get.role,
                          traling: Text("${user?.data?.type?.name?.value}", style: KTextStyle.of(context).body3),
                        ),
                        // ProfileTile(
                        //   leading: KHelper.list,
                        //   title: Tr.get.company_name,
                        //   traling: Text('${user?.data?.company?.id??''}', style: KTextStyle.of(context).body3),
                        // ),
                        ProfileTile(
                          leading: KHelper.branches,
                          title: Tr.get.branches,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () => Nav.to(const BranchesList()),
                        ),
                        if (user?.data?.type?.id != 1)
                          ProfileTile(
                            leading: KHelper.payment,
                            title: Tr.get.payment_information,
                            traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                            onTap: () => Nav.to(const PaymentView()),
                          ),
                        ProfileTile(
                          leading: KHelper.passworrd,
                          title: Tr.get.change_password,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () => Nav.to(const ChangePassword()),
                        ),

                        BlocProvider(
                          create: (context) => Di.updateUserBloc,
                          child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                success: () {
                                  Nav.offAll(const LoginScreen());
                                  KStorage.i.delToken;
                                  KStorage.i.delUserInfo;
                                },
                              );
                            },
                            builder: (context, state) {
                              return ProfileTile(
                                leading: KHelper.deactivate,
                                title: Tr.get.deactivate_account,
                                traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                                onTap: () {
                                  ActionDialog(
                                    content: [
                                      Text(
                                        state.maybeWhen(
                                          orElse: () => Tr.get.deactivate_account,
                                          loading: () => Tr.get.loading,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                    approveAction: Tr.get.yes_message,
                                    cancelAction: Tr.get.no_message,
                                    onApproveClick: () async {
                                      Navigator.pop(context);
                                      UpdateUserBloc.of(context).blockAccount;
                                      UpdateUserBloc.of(context).update();
                                    },
                                    onCancelClick: () {
                                      Navigator.pop(context);
                                    },
                                  ).show<void>(context);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ProfileSectionTitle(title: Tr.get.my_settings),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).fillContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        ProfileTile(
                          leading: KHelper.theme,
                          title: Tr.get.theme_mode,
                          traling: const ThemeToggleBtn(size: KHelper.iconSize2),
                          onTap: ThemeBloc.of(context).updateThemeMode,
                        ),
                        if (KStorage.i.getUserInfo?.data?.contract != null && KStorage.i.getUserInfo?.data?.type?.id != 1)
                          ProfileTile(
                            leading: KHelper.contract,
                            title: Tr.get.contracts,
                            traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                            onTap: () async {
                              KHelper.showCustomBottomSheet(
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(title: Text(Tr.get.ar), trailing: const Icon(Icons.arrow_right_alt), onTap: () => onTap(true)),
                                        const Divider(color: Colors.grey),
                                        ListTile(title: Text(Tr.get.en), trailing: const Icon(Icons.arrow_right_alt), onTap: () => onTap(false))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        if (KStorage.i.getSettings?.data?.first.privacyContent?.sales != null)
                          ProfileTile(
                            leading: KHelper.privacyPolicy,
                            title: Tr.get.privacy_policy,
                            traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                            onTap: () async {
                              final String? url = KStorage.i.getSettings?.data?.first.privacyContent?.sales;
                              debugPrint('================= $url : ');
                              if (url != null) {
                                if (!Uri.parse(url).isAbsolute) {
                                  KHelper.showSnackBar('invalid url');
                                  return;
                                }
                                Nav.to(
                                  PdfViewer(
                                    url: url,
                                  ),
                                );
                              }
                            },
                          ),
                        ProfileTile(
                          leading: KHelper.dashBoard,
                          title: Tr.get.dashboard,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            final String? url = KStorage.i.getSettings?.data?.firstOrNull?.dashboard?.sales;
                            debugPrint('================= $url : ');
                            if (url != null) {
                              if (!Uri.parse(url).isAbsolute) {
                                KHelper.showSnackBar('invalid url');
                                return;
                              }
                              Nav.to(KWebView(url: url, onSuccess: () {}, onFail: () {}));
                            }
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.help,
                          title: Tr.get.help,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            String? encodeQueryParameters(Map<String, String> params) {
                              return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
                            }

                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'support@forallfa.com',
                              query: encodeQueryParameters(<String, String>{'subject': 'I need Help , Please Contact Me'}),
                            );
                            launchUrl(emailLaunchUri);
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.share,
                          title: Tr.get.share,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            await Share.share(KEndPoints.appsStoreLink);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).fillContainer,
                  child: BlocConsumer<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Nav.offAll(const LoginScreen());
                        },
                      );
                    },
                    builder: (context, state) {
                      return ProfileTile(
                        leading: KHelper.logout,
                        title: state.maybeWhen(orElse: () => Tr.get.log_out, loading: () => Tr.get.loading),
                        traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                        onTap: () {
                          LogoutBloc.of(context).logout();
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  onTap(bool ar) async {
    final String url = (ar ? KStorage.i.getUserInfo?.data?.contract?.ar.toString() : KStorage.i.getUserInfo?.data?.contract?.en.toString()) ?? '';
    await launchUrlString("https://view.officeapps.live.com/op/embed.aspx?src=$url", mode: LaunchMode.inAppWebView);
  }
}
