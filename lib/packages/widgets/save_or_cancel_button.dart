import 'package:flutter/material.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../shared/localization/trans.dart';
import '../shared/theme/colors.dart';
import 'custom_button.dart';

class SaveOrCancelButton extends StatelessWidget {
  const SaveOrCancelButton({super.key, required this.onPressed});
  final dynamic Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KButton(
            title: Tr.get.save,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextButton(
            child: Text(Tr.get.cancel, style: TextStyle(color: KColors.of(context).accentColor)),
            onPressed: () {
              Nav.back();
            },
          ),
        ),
      ],
    );
  }
}
