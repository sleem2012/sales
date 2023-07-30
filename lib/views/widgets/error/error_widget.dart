import 'package:flutter/material.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/text_theme.dart';

class KErrorWidget extends StatelessWidget {
  final void Function()? onTryAgain;
  final String? error;
  final bool? isError;
  final Widget? widget;

  const KErrorWidget({Key? key, this.onTryAgain, this.error, this.widget, this.isError = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget != null) widget!,
            Text(
              error ?? Tr.get.try_later,
              style: isError! ? KTextStyle.of(context).error : KTextStyle.of(context).body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            if (onTryAgain != null && error != Tr.get.location_denaid_permanently)
              TextButton(
                onPressed: onTryAgain,
                child: Text(Tr.get.try_again, style: KTextStyle.of(context).title),
              ),
          ],
        ),
      ),
    );
  }
}
