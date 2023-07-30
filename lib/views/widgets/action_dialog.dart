import 'package:flutter/material.dart';

import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';

class ActionDialog extends StatelessWidget {
  final String? title;
  final List<Widget> content;
  final ShapeBorder? shape;
  final String? approveAction;
  final String? cancelAction;
  final void Function()? onApproveClick;
  final void Function()? onCancelClick;

  const ActionDialog({
    Key? key,
    this.title,
    this.content = const <Widget>[],
    this.shape,
    this.approveAction,
    this.cancelAction,
    this.onApproveClick,
    this.onCancelClick,
  }) : super(key: key);

  void show<T>(BuildContext context) => showModalBottomSheet<T>(
        backgroundColor: KColors.of(context).background,
        shape: shape ?? const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (_) => SizedBox(child: Wrap(children: [this])),
      );

  @override
  Widget build(BuildContext context) {
    assert(onCancelClick != null && cancelAction != null);
    assert(onApproveClick != null && approveAction != null);

    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              textAlign: TextAlign.center,
              style: KTextStyle.of(context).body2,
            )
          : null,
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: KColors.of(context).background,
      actionsAlignment: MainAxisAlignment.center,
      icon: const Icon(
        Icons.warning_amber_outlined,
        size: 50,
      ),
      actions: [
        Column(
          children: [
            if (onApproveClick != null)
              KButton(
                title: approveAction!,
                onPressed: onApproveClick!,
              ),
            // SizedBox(height: Get.height*.02,),

            if (onCancelClick != null)
              TextButton(
                onPressed: onCancelClick!,
                child: Text(cancelAction!),
                // style: ButtonStyle(backgroundColor: Colors.red),
              ),
          ],
        ),
      ],
      actionsPadding: const EdgeInsets.all(25),
      contentPadding: const EdgeInsets.only(top: 10),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: content,
      ),
    );
  }
}
