import 'package:flutter/material.dart';
import '../../../data/models/commission/commission_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';

class CommisoinDetails extends StatelessWidget {
  const CommisoinDetails({Key? key, required this.commision}) : super(key: key);
  final CommisoinData commision;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).elevatedBox,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(Tr.get.typee), Text(Tr.get.transaction_details)],
            ),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: FittedBox(child: Text(commision.type ?? ''))),
                Expanded(
                    child: FittedBox(
                  child: Text(
                    commision.transactionDetails ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),)
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
