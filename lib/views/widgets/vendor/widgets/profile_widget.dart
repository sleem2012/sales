import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../packages/shared/theme/text_theme.dart';

import '../../../../data/models/branch_staff/vendors_model.dart';
import '../../../../packages/chat/data/models/chat_model.dart';
import '../../../../packages/chat/view/widgets/chat_icon_btn.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.vendor,
  }) : super(key: key);
  final VendorsModel vendor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        backgroundImage: CachedNetworkImageProvider(vendor.company?.logo?.s128px ?? ''),
      ),
      title: Text(
        vendor.company?.owner?.name ?? '',
        style: KTextStyle.of(context).title,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vendor.company?.owner?.email ?? '',
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            vendor.company?.owner?.mobile ?? '',
            style: KTextStyle.of(context).hint,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            vendor.company?.owner?.detailedAddress ?? '',
            style: KTextStyle.of(context).hint,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              KChatIconButton(roomType: ChatRoomType.user, room_user_id: vendor.id),
              const SizedBox(width: 20),
              // KIconButton(
              //   child: const Icon(Icons.block, color: Colors.red),
              //   onPressed: () {
              //     Get.dialog(
              //       vendor.company?.owner?.isBlocked == false
              //           ? BlockUserDialog(
              //         id: vendor.company?.owner?.id ?? 0,
              //         isBlocked: vendor.company?.owner?.isBlocked == false ? 1 : 0,
              //       )
              //           : UnBlockUserDialog(
              //         id: vendor.company?.owner?.id ?? 0,
              //         reson: vendor.company?.owner?.blockReason ?? '',
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
