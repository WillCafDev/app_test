import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../template/colors_manager.dart';
import '../template/textstyle_manager.dart';

typedef ValidatorType = String Function(String);
typedef OnChangedCallback = void Function(String);

class TextInputNew extends StatelessWidget {
  const TextInputNew({
    required this.hintText,
    required this.formControlName,
    required this.labelText,
    this.obscureText = false,
    this.textMaxLength = 'El máximo del campo es de 30 caracteres.',
    this.textMinLength = 'El mínimo del campo es de 6 caracteres.',
    this.textPattern = 'El campo no usa caracteres especiales.',
    this.autoFocus = false,
    this.enabled = true,
    this.colorEnabled = grey,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final bool? obscureText;
  final String? formControlName;
  final String? textMaxLength;
  final String? textMinLength;
  final String? textPattern;
  final bool autoFocus;
  final bool enabled;
  final String labelText;
  final Color colorEnabled;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: ReactiveTextField<Object?>(
          formControlName: formControlName,
          autofocus: autoFocus,
          validationMessages: (FormControl<Object?> control) =>
              <String, String>{
            'required': '$hintText es requerido.',
            'maxLength': textMaxLength!,
            'minLength': textMinLength!,
            'pattern': textPattern!,
          },
          readOnly: enabled,
          style: CawafTypographyStyle.body15.copyWith(
            color: colorEnabled,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            labelStyle: CawafTypographyStyle.body15.copyWith(
              color: colorEnabled,
            ),
            hintStyle: CawafTypographyStyle.body15.copyWith(
              color: colorEnabled,
            ),
            errorStyle: CawafTypographyStyle.body12.copyWith(
              color: Colors.red,
            ),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorEnabled,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorEnabled,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorEnabled,
              ),
            ),
          ),
          obscureText: obscureText ?? false,
        ),
      );
}
