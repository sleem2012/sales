import 'package:flutter/material.dart';
import '../../../data/models/commission/commission_model.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';

class KeyValueText extends StatelessWidget {
  final CommisoinData commision;

  const KeyValueText({
    super.key,
    required this.commision,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: KHelper.of(context).transactionCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                    child: Text(
                  commision.transactionDetails ?? '',
                  style: KTextStyle.of(context).body2,
                ),),
                const SizedBox(
                  height: 5,
                ),
                Text(commision.createdAt?.substring(0, 10) ?? ''),
                const SizedBox(
                  height: 5,
                ),
                Text("${commision.forallAmount}  ${commision.currency}", style: KTextStyle.of(context).title3.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(commision.state ?? ''),
            ],
          ),

          // Text(
          //   commision.state ?? '',
          //   style: KTextStyle.of(context).body,
          // ),
          // Text(
          //   "${commision.forallAmount}  ${commision.currency}",
          //   style: KTextStyle.of(context).names,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // Text(
          //   commision.createdAt ?? '',
          //   style: KTextStyle.of(context).names,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // IconButton(
          //     onPressed: () {
          //       Get.bottomSheet(CommisoinDetails(
          //         commision: commision,
          //       ));
          //     },
          //     icon:  const Text('!',style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
