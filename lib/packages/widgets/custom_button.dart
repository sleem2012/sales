import 'package:flutter/material.dart';
import '../shared/theme/colors.dart';
import '../shared/theme/text_theme.dart';

class KButton extends StatelessWidget {
  const KButton({super.key, required this.title, required this.onPressed, this.width, this.height, this.isLoading = false, this.color});

  final String title;
  final bool? isLoading;
  final Color? color;
  final Function() onPressed;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: isLoading ?? false ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: color ?? KColors.accentColorD,
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        child: Container(
          width: width ?? w,
          height: height ?? 45,
          alignment: Alignment.center,
          child: isLoading!
              ? FittedBox(
                  child: SizedBox(
                    height: (height ?? 45) - 10,
                    child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)),
                  ),
                )
              : Text(title, style: KTextStyle.of(context).btntitle),
        ),
      ),
    );
  }
}
