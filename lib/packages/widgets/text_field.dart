import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/theme/colors.dart';
import '../shared/theme/text_theme.dart';

class KTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon, prefixIcon;
  final String? hintText, errorText;
  final bool autofocus, enabled, expanded;
  final double? kWidth, height;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? formatter;
  final bool obscureText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final Color? fillColor;
  final InputDecoration? kDecoration;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final Decoration? boxDecoration;
  final TextStyle? style;
  final String? initVal;

  const KTextFormField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.onTap,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.autofocus = false,
    this.prefixIcon,
    this.enabled = true,
    this.expanded = false,
    this.kWidth,
    this.height,
    this.maxLines,
    this.formatter,
    this.textAlign,
    this.focusNode,
    this.fillColor,
    this.initVal,
    this.readOnly,
    this.kDecoration,
    this.maxLength,
    this.style,
    this.textInputAction,
    this.boxDecoration,
    this.hintStyle,
  });

  @override
  State<KTextFormField> createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  onChange(String? p0) => setState(() => _enteredText = p0);

  String? _enteredText = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly ?? false,
      focusNode: widget.focusNode,
      textAlign: widget.textAlign ?? TextAlign.start,
      inputFormatters: widget.formatter,
      keyboardAppearance: Theme.of(context).brightness,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      onTap: widget.onTap,
      expands: widget.expanded,
      initialValue: widget.controller == null ? widget.initVal : null,
      cursorColor: KColors.of(context).cursor,
      validator: widget.validator,
      style: widget.style ?? KTextStyle.of(context).body.copyWith(fontSize: 15),
      onChanged: (value) {
        widget.onChanged?.call(value);
        onChange(value);
      },
      obscureText: widget.obscureText,
      maxLines: widget.maxLines ?? (widget.obscureText ? 1 : null),
      maxLength: widget.maxLength,
      textAlignVertical: TextAlignVertical.center,
      decoration: widget.kDecoration ??
          InputDecoration(
            //filled: true,
            //fillColor: fillColor,
            // label: widget.hintText != null
            //     ? Text(widget.hintText!, style: KTextStyle.of(context).body)
            //     : null,

            labelText: widget.hintText,
            labelStyle: widget.hintStyle ?? KTextStyle.of(context).hint,
            floatingLabelStyle: widget.hintStyle ?? KTextStyle.of(context).body,
            hintStyle: widget.hintStyle ?? KTextStyle.of(context).hint,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            errorStyle: KTextStyle.of(context).error,
            //alignLabelWithHint: true,
            errorText: widget.errorText,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            floatingLabelBehavior: widget.prefixIcon == null ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,

            counterText: widget.maxLength != null ? '${_enteredText?.length.toString()} / ${widget.maxLength}' : null,
          ),
    );
  }
}
