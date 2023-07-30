import 'package:flutter/material.dart';
import '../../../packages/shared/theme/text_theme.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key, required this.icon, required this.title, required this.count, required this.amount}) : super(key: key);
  final IconData icon;
  final String title;
  final String count;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon),
          Text(title, style: KTextStyle.of(context).body),
          Column(
            children: [
              Text(count, style: KTextStyle.of(context).names),
              Text(amount, style: KTextStyle.of(context).names),
            ],
          ),
        ],
      ),
    );
  }
}
