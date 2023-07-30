import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../views/widgets/country_code.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/icon_button.dart';
import '../../../widgets/text_field.dart';
import '../../../extensions.dart';
import '../../../multi_select_dialog/index.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../widgets/barcode_scaner_btn.dart';
import '../../model/dynamic_ui_model.dart';
import '../../model/keyboard_union/keyboard_union.dart';
import '../../model/measurement/measurements.dart';
import '../dynamic_helper/dynamic_helper.dart';
import 'sub_widgets/plus_btn.dart';

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({
    Key? key,
    required this.field,
    required this.onChanged,
    this.error,
    this.onAdd,
    required this.skipValidation,
    this.style,
    this.onFilter,
  }) : super(key: key);
  final DUIFieldModel field;
  final String? error;
  final bool skipValidation;
  final Function(String) onChanged;
  final Function(String)? onAdd;
  final Function(String)? onFilter;
  final TextStyle? style;

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  String cCode = '+966';
  String fieldVal = '';

  late final isPhone = DynamicUiVM.allowedInput(widget.field).isPhone;
  late final isBarcode = (widget.field).keyboard is DynamicKeyboardUnionBarcode;
  late final TextEditingController _textController = TextEditingController(text: widget.field.format?.initial);
  late MeasurementsConversion? selectedMeasurement = DynamicUiVM.allowedInput(widget.field).measurementsConversion?.firstOrNull;
  late final isMeasurement = DynamicUiVM.allowedInput(widget.field).measurementsConversion != null;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  convert() {
    final v = selectedMeasurement?.convert(double.tryParse(_textController.text) ?? 0.0);
    if (v != null && selectedMeasurement != null) {
      widget.onChanged(v == 0 ? "" : v.toString());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isPhone ? TextDirection.ltr : Directionality.of(context),
      child: Row(
        children: [
          Expanded(
            child: KTextFormField(
              hintText: widget.field.placeholder.capitalized,
              keyboardType: DynamicUiVM.allowedInput(widget.field).inputType,
              formatter: DynamicUiVM.allowedInput(widget.field).formatter,
              obscureText: DynamicUiVM.allowedInput(widget.field).obscure,
              errorText: widget.error,
              controller: _textController,
              style: widget.style,
              autofocus: false,
              suffixIcon: widget.onFilter != null
                  ? KIconButton(
                      child: const Icon(Icons.search),
                      onPressed: () => widget.onFilter?.call(fieldVal),
                    )
                  : isMeasurement
                      ? FittedBox(
                          child: SizedBox(
                            width: 60,
                            child: MeasurementsDropDown(
                              field: widget.field,
                              onChanged: (p0) {
                                selectedMeasurement = p0;
                                convert();
                              },
                            ),
                          ),
                        )
                      : isBarcode
                          ? BarcodeIconBtn(
                              onScanned: (code) {
                                _textController.setText(code);
                                widget.onChanged(code);
                              },
                            )
                          : null,
              prefixIcon: isPhone
                  ? CountryCodeWidget(
                      onChanged: (p0) {
                        cCode = p0?.dialCode ?? '+966';
                        widget.onChanged(isPhone ? "(${cCode.replaceAll('+', '')})$fieldVal" : fieldVal);
                      },
                    )
                  : null,
              validator: (p0) {
                if ((p0!.isEmpty && widget.field.isRequired) && widget.skipValidation) {
                  return Tr.get.field_required;
                } else {
                  return null;
                }
              },
              onChanged: (p0) {
                fieldVal = p0;
                convert();
                if (selectedMeasurement != null) return;
                widget.onChanged(isPhone ? "(${cCode.replaceAll('+', '')})$fieldVal" : fieldVal);
              },
            ),
          ),
          if (widget.field.multi && widget.onAdd != null) const SizedBox(width: 5),
          if (widget.field.multi && widget.onAdd != null)
            DUIPlusBtn(
              onPressed: () {
                widget.onAdd?.call(isPhone ? "(${cCode.replaceAll('+', '')})$fieldVal" : fieldVal);
                fieldVal = '';
                _textController.clear();
              },
            )
        ],
      ),
    );
  }
}

class MeasurementsDropDown extends StatelessWidget {
  const MeasurementsDropDown({super.key, required this.field, required this.onChanged});
  final DUIFieldModel field;
  final Function(MeasurementsConversion?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: KDropdownBtn<MeasurementsConversion>(
        title: DynamicUiVM.allowedInput(field).measurementsConversion?.first.unit ?? '',
        onChanged: onChanged,
        value: DynamicUiVM.allowedInput(field).measurementsConversion?.first,
        showArrow: false,
        items: (DynamicUiVM.allowedInput(field).measurementsConversion ?? [])
            .map(
              (e) => MultiSelectorItem<MeasurementsConversion>(
                value: e,
                child: Text(e.unit, overflow: TextOverflow.ellipsis, maxLines: 1, style: KTextStyle.of(context).body),
                searchValue: e.unit,
              ),
            )
            .toList(),
        btnDecoration: KHelper.of(context).filled.copyWith(color: Colors.transparent),
      ),
    );
  }
}
