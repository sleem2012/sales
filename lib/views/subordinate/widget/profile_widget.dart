import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../packages/modules/models/company/company_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/colors.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.employees,
  }) : super(key: key);
  final CompanyOwner employees;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.comfortable,
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 20,
      horizontalTitleGap: 0,
      isThreeLine: true,
      tileColor: Colors.transparent,
      textColor: KColors.of(context).accentColor,
      leading: CircleAvatar(
        radius: Get.width * .1,
        backgroundImage: CachedNetworkImageProvider(
          employees.image?.s128px?.toString() ?? dummyNetImg,
        ),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${employees.email}", style: TextStyle(color: KColors.of(context).accentColor)),
          Text("${employees.detailedAddress}"),
          Text("${Tr.get.birthdate}: ${employees.birthdate ?? ""}"),
          Text("${Tr.get.joined}: ${employees.joinedAt}"),
        ],
      ),
      title: Text("${employees.name}", style: KTextStyle.of(context).title),
    );
  }
}
