import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../template/colors_manager.dart';
import '../template/textstyle_manager.dart';

typedef ValidatorType = String Function(String);
typedef OnChangedCallback = void Function(String);

class TextInput extends StatefulWidget {
  const TextInput({
    required this.hintText,
    required this.formControlName,
    this.obscureText = false,
    this.textMaxLength = 'El máximo del campo es de 30 caracteres.',
    this.textMinLength = 'El mínimo del campo es de 6 caracteres.',
    this.textPattern = 'El campo no usa caracteres especiales.',
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final bool? obscureText;
  final String? formControlName;
  final String? textMaxLength;
  final String? textMinLength;
  final String? textPattern;
  final bool autoFocus;
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool showEyeIcon = false;

  @override
  void initState() {
    showEyeIcon = widget.obscureText!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: ReactiveTextField<Object?>(
          formControlName: widget.formControlName,
          autofocus: widget.autoFocus,
          validationMessages: (FormControl<Object?> control) =>
              <String, String>{
            'required': '${widget.hintText} es requerido.',
            'maxLength': widget.textMaxLength!,
            'minLength': widget.textMinLength!,
            'pattern': widget.textPattern!,
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: CawafTypographyStyle.body15.copyWith(
              color: grey,
            ),
            errorStyle: CawafTypographyStyle.body12.copyWith(
              color: Colors.red,
            ),
          ),
          obscureText: widget.obscureText ?? false,
        ),
      );
}
