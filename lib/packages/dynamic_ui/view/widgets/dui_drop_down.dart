// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../extensions.dart';
import '../../../multi_select_dialog/index.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../model/dynamic_ui_model.dart';

class DynamicDropDown extends StatelessWidget {
  const DynamicDropDown({Key? key, required this.onChanged, required this.field, this.value, this.error}) : super(key: key);
  final Function(DUICollectionModel?) onChanged;
  final DUIFieldModel field;
  final DUICollectionModel? value;
  final String? error;
  @override
  Widget build(BuildContext context) {
    final items = field.collection
        .map(
          (v) => KHelper.of(context).itemView<DUICollectionModel>(
            value: v,
            itemText: v.placeholder ?? '',
            icon: (v.icon != null)
                ? SvgPicture.network(
                    v.icon.toString(),
                    width: 25,
                    height: 25,
                    color: KColors.accentColorD,
                  )
                : null,
          ),
        )
        .toList();

    return MultiSelector.single<DUICollectionModel>(
      title: field.placeholder.capitalized,
      items: items,
      value: value,
      error: error?.capitalized,
      type: SelectorViewType.sheet,
      btnDecoration: KHelper.of(context).textFieldDecoration,
      popupDecoration: KHelper.of(context).elevatedBox,
      onChanged: onChanged,
      hintStyle: KTextStyle.of(context).hint,
      titleStyle: KTextStyle.of(context).body,
      validator: (p0) {
        if (p0 == null && field.isRequired) {
          return Tr.get.field_required;
        } else {
          return null;
        }
      },
    );
  }
}
