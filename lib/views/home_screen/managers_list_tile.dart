import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';

import '../subordinate/subordinate.dart';

class ManagersListTile extends StatelessWidget {
  final CompanyOwner data;

  const ManagersListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).elevatedBox,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          backgroundImage: CachedNetworkImageProvider(data.image?.s128px?.toString() ?? dummyNetImg),
        ),
        title: Text('${data.name}', style: KTextStyle.of(context).body2),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (data.isBlocked ?? false)
                  ? Tr.get.blocked
                  : (data.isOnline ?? false)
                      ? Tr.get.online
                      : Tr.get.offline,
              style: TextStyle(
                fontSize: 14,
                color: (data.isBlocked ?? false)
                    ? Colors.red
                    : (data.isOnline ?? false)
                        ? Colors.green
                        : Colors.red,
              ),
            ),
            if (data.achievedContracts != null)
              Text.rich(
                TextSpan(
                  text: '${data.achievedContracts} ', // default text s// tyle
                  style: KTextStyle.of(context).body2,
                  children: [
                    TextSpan(text: Tr.get.contracts, style: KTextStyle.of(context).body3),
                  ],
                ),
              )
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubordinateScreen(employees: data, isSales: data.type?.id == 7),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff45C0BE),
            shape: const CircleBorder(),
          ),
          child: const Icon(Icons.visibility),
        ),
      ),
    );
  }
}
