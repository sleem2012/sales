import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/dashboard/pending_applications_model.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/chat/data/models/chat_model.dart';
import '../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/icon_button.dart';
import '../../packages/widgets/image_widget.dart';
import '../subordinate/widget/edit_user.dart';
import '../widgets/appbar.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/photo_viewer.dart';

class PendingAppDetails extends StatelessWidget {
  const PendingAppDetails({Key? key, required this.data}) : super(key: key);
  final PendingApplicationsData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: BgImg(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(data.user?.image?.s128px ?? ''),
                  ),
                  title: Text(
                    data.user?.name ?? '',
                    style: KTextStyle.of(context).title,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.user?.email ?? '',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data.user?.mobile ?? '',
                        style: KTextStyle.of(context).hint,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data.user?.address?.detailedAddress ?? '',
                        style: KTextStyle.of(context).hint,
                      ),
                      Row(
                        children: [
                          KChatIconButton(roomType: ChatRoomType.user, room_user_id: data.user?.id),
                          const SizedBox(width: 20),
                          KIconButton(
                            child: const Icon(Icons.block, color: Colors.red),
                            onPressed: () {
                              KHelper.showCustomBottomSheet(
                                data.user?.userCompany?.owner?.isBlocked == false
                                    ? BlockUserDialog(
                                        id: data.user?.userCompany?.owner?.id ?? 0,
                                        isBlocked: data.user?.userCompany?.owner?.isBlocked == false ? 1 : 0,
                                      )
                                    : UnBlockUserDialog(
                                        id: data.user?.userCompany?.owner?.id ?? 0,
                                        reson: data.user?.userCompany?.owner?.blockReason ?? '',
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Tr.get.identity,
                      style: KTextStyle.of(context).title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        if (data.commercial?.identity?.file?.s128px != null)
                          InkWell(
                            onTap: () {
                              Nav.to(KPhotoView(image: data.commercial?.identity?.file?.s512px ?? ''));
                            },
                            child: KImageWidget(
                              imageUrl: data.commercial?.identity?.file?.s128px ?? '',
                            ),
                          ),
                        if (data.commercial?.identity?.fileBack?.s128px != null)
                          InkWell(
                            onTap: () {
                              Nav.to(KPhotoView(image: data.commercial?.identity?.fileBack?.s512px ?? ''));
                            },
                            child: KImageWidget(
                              imageUrl: data.commercial?.identity?.fileBack?.s128px ?? '',
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Tr.get.passport,
                      style: KTextStyle.of(context).title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        if (data.commercial?.passport?.file?.s128px != null)
                          InkWell(
                            onTap: () {
                              Nav.to(KPhotoView(image: data.commercial?.passport?.file?.s512px ?? ''));
                            },
                            child: KImageWidget(
                              imageUrl: data.commercial?.passport?.file?.s128px ?? '',
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Tr.get.work_license,
                      style: KTextStyle.of(context).title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        if (data.commercial?.freeWorkLicense?.file?.s128px != null)
                          InkWell(
                            onTap: () {
                              Nav.to(KPhotoView(image: data.commercial?.freeWorkLicense?.file?.s512px ?? ''));
                            },
                            child: KImageWidget(
                              imageUrl: data.commercial?.freeWorkLicense?.file?.s128px ?? '',
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
