

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medical_reminder/util/ui_helper.dart';

const MAX_LINES = 1;

class CustomTextField extends StatelessWidget {
  final String attribute;
  final String label;
  final String initialValue;
  final int maxLength;
  final bool readOnly;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle style;
  final double verticalPadding;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final FocusNode focus;
  final Function(bool) onFocusChanged;
  final ValueChanged<String> onSaved;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  final String Function(String) validator;

  const CustomTextField({
    Key key,
    @required this.attribute,
    this.label,
    this.initialValue,
    this.maxLength,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.verticalPadding,
    this.style,
    this.readOnly = false,
    this.inputFormatters,
    this.obscureText,
    this.focus,
    this.onFocusChanged,
    this.validator,
    this.onEditingComplete,
    this.controller,
    @required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _registerListenersIfNeeded();
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 0),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: this.verticalPadding ?? UI.marginStandardHalf),
        child: FormBuilderTextField(
          //attribute: attribute,
          controller: controller,
          initialValue: initialValue,
          maxLines: MAX_LINES,
          readOnly: readOnly,
          maxLength: maxLength,
       //   autovalidate: AutovalidateMode.always,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          decoration: decoration ?? InputDecoration(labelText: label ?? ''),
          textInputAction: textInputAction ?? TextInputAction.done,
          onEditingComplete: onEditingComplete,
          style: style ?? UI.inputTextStyle(),
          inputFormatters: inputFormatters ?? [],
          focusNode: focus,
          onSaved: (val) => onSaved(val),
         // validators: validator == null ? [] : [(value) => validator(value)],
        ),
      ),
    );
  }

  void _registerListenersIfNeeded() {
    // ignore: invalid_use_of_protected_member
    if (focus?.hasListeners ?? true == false) {
      focus.addListener(() {
        onFocusChanged?.call(focus.hasFocus);
      });
    }
  }
}
