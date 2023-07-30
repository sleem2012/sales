import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data/models/notifications.dart';
import '../../../../../di.dart';
import '../../../../../views/widgets/error/error_widget.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../../views/widgets/new_bg_img.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/text_theme.dart';
import '../bloc/get_notifications_bloc.dart';
import '../bloc/notifications_state.dart';
import 'notifications_tile.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const KAppBar(),§
      body: BgImg(
        child: BlocProvider(
          create: (context) => Di.getNotifications..getNotifications(),
          child: BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const KLoadingOverlay(isLoading: true),
                loading: () => const KLoadingOverlay(isLoading: true),
                success: (model) {
                  return (model.notificationsData?.isEmpty ?? true)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/empty_inbox.svg'),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(Tr.get.your_inbox_is_empty, style: KTextStyle.of(context).names),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(top: 20, bottom: 100),
                          itemCount: model.notificationsData?.length ?? 0,
                          itemBuilder: (context, index) {
                            return NotificationsTile(
                              notificationsData: model.notificationsData?[index] ?? NotificationsData(),
                            );
                          },
                        );
                },
                error: (error) => KErrorWidget(
                  error: error,
                  isError: true,
                  onTryAgain: NotificationsBloc.of(context).getNotifications,
                ),
              );
            },
          ),
        ),
      ),
      // floatingActionButton: Directionality(
      //   textDirection: TextDirection.ltr,
      //   child: FloatingActionButton.small(
      //     onPressed: () => Nav.back(),
      //     child: const Icon(Icons.arrow_forward_rounded),
      //   ),
      // ),arrow_forward_rounded
    );
  }
}
