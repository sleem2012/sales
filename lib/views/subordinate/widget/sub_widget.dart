import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../../packages/modules/models/company/company_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../widgets/photo_viewer.dart';
import '../../widgets/slug_drop_down.dart';
import 'edit_user.dart';
import 'rounded_button.dart';

class SubWidget extends StatefulWidget {
  const SubWidget({Key? key, required this.employees}) : super(key: key);
  final CompanyOwner employees;

  @override
  State<SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<SubWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), // adjust the duration as needed
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = KHelper.of(context).elevatedBox.copyWith(color: KHelper.of(context).elevatedBox.color?.withOpacity(.5), borderRadius: BorderRadius.circular(0));
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: decoration,
          width: width,
          padding: EdgeInsets.symmetric(vertical: Get.height * .032),
          child: Row(
            children: [
              SizedBox(width: Get.width * .36),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.employees.name.toString().capitalize} ",
                            style: KTextStyle.of(context).title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "#${widget.employees.alternative_id ?? widget.employees.id}",
                            style: KTextStyle.of(context).body,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Tr.get.role),
                        Text(widget.employees.type?.name?.value ?? ''),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Tr.get.birthdate),
                        Text(widget.employees.birthdate?.replaceAll(RegExp('[^0-9]'), ' - ') ?? ""),
                      ],
                    ),
                    const SizedBox(height: 5),
                    if (widget.employees.joinedAt != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(Tr.get.joined),
                          Text("${widget.employees.joinedAt?.substring(0, 10).replaceAll(RegExp('[^0-9]'), ' - ')}"),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: !Tr.isAr ? 20 : null,
          bottom: -10,
          right: Tr.isAr ? 20 : null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: GestureDetector(
              onTap: () {
                Nav.to(
                  KPhotoView(image: widget.employees.image!.s512px ?? dummyNetImg),
                );
              },
              child: KImageWidget(
                imageUrl: widget.employees.image?.s128px ?? dummyNetImg,
                height: 100,
                width: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (widget.employees.mobile != null)
          Positioned(
            bottom: 5,
            right: Tr.isAr ? Get.width * .35 : null,
            left: !Tr.isAr ? Get.width * .35 : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (searchCollection?.users?.view?.chat == true) KChatIconButton(roomType: ChatRoomType.user, room_user_id: widget.employees.id),
                SizedBox(
                  width: Get.width * .05,
                ),
                if (searchCollection?.users?.view?.mobile == true)
                  RoundedButton(
                    icon: Icons.phone,
                    onTap: () async {
                      await launchUrlString(
                        'tel:${widget.employees.mobile}',
                      );
                    },
                  ),
                SizedBox(
                  width: Get.width * .05,
                ),
                RoundedButton(
                  icon: Icons.email,
                  onTap: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: widget.employees.email,
                    );
                    launchUrl(emailLaunchUri);
                  },
                ),
                SizedBox(
                  width: Get.width * .05,
                ),
                if (searchCollection?.users?.view?.block == true)
                  RoundedButton(
                    icon: Icons.block,
                    onTap: () {
                      KHelper.showCustomBottomSheet(
                        widget.employees.isBlocked == false
                            ? BlockUserDialog(
                                id: widget.employees.id ?? 0,
                                isBlocked: widget.employees.isBlocked == false ? 1 : 0,
                              )
                            : UnBlockUserDialog(
                                id: widget.employees.id ?? 0,
                                reson: widget.employees.blockReason ?? '',
                              ),
                      );
                    },
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
