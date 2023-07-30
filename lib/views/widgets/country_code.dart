import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/text_theme.dart';

class CountryCodeWidget extends StatelessWidget {
  final void Function(CountryCode?)? onChanged, onInit;
  const CountryCodeWidget({Key? key, this.onChanged, this.onInit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      showFlag: false,
      barrierColor: KColors.of(context).background,
      textStyle: KTextStyle.of(context).body2,
      dialogTextStyle: KTextStyle.of(context).body,
      initialSelection: 'SA',
      showFlagDialog: true,
      closeIcon: Icon(Icons.close, color: KColors.of(context).activeIcons),
      dialogBackgroundColor: KColors.of(context).background,
      comparator: (a, b) => b.name!.compareTo(a.name!),
      onInit: onInit,
    );
  }
}
