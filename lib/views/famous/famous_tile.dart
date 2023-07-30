import 'package:flutter/material.dart';
import '../../data/models/famous/famous_data.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import 'package:get/get.dart';

import 'famous_details.dart';

class FamousTile extends StatelessWidget {
  final FamousEmployee data;

  const FamousTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      width: Get.width,
      decoration: KHelper.of(context).elevatedBox,
      child: ListTile(
          onTap: () {
            if (data.state == "joined") Nav.to(FamousDetails(data: data));
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Text("${Tr.get.email}  :  ", style: KTextStyle.of(context).body2),
              ),
              Expanded(
                  child: Text(
                data.email ?? '',
                style: KTextStyle.of(context).body2,
              ),),
            ],
          ),
          trailing: Text(
            data.coupon ?? '',
            style: KTextStyle.of(context).body,
          ),),
    );
  }
}
