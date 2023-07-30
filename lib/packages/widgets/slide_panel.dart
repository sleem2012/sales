import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../shared/theme/helper.dart';

ActionPane actionPane(IconData? icon, Color color, Function() onPressed, {bool? isToENd}) {
  return ActionPane(
    dragDismissible: isToENd ?? true,
    motion: const StretchMotion(),
    dismissible: DismissiblePane(onDismissed: onPressed),
    children: [
      SlidableAction(
        borderRadius: BorderRadius.circular(KHelper.cornerRadius),
        onPressed: (context) {
          onPressed.call();
        },
        backgroundColor: color,
        foregroundColor: Colors.white,
        icon: icon,
      ),
    ],
  );
}
