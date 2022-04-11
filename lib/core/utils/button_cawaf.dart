import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/template/colors_manager.dart';
import '../../../core/template/textstyle_manager.dart';

enum StyleButton {
  primaryGreen,
  primaryBlue,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
  back,
}

class ButtonCawaf extends StatelessWidget {
  const ButtonCawaf({
    required this.onPressed,
    required this.styleButton,
    required this.label,
    Key? key,
  }) : super(key: key);
  final Function()? onPressed;
  final StyleButton styleButton;
  final String label;

  @override
  Widget build(BuildContext context) {
    AbstractControl<Object>? form = ReactiveForm.of(context);
    switch (styleButton) {
      case StyleButton.primaryBlue:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.primaryGreen:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor:
                MaterialStateProperty.all<Color>(form.valid ? green : green),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.secondary:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.danger:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.dark:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.info:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.light:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.warning:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.success:
        return TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(form!.valid ? white : grey100),
            backgroundColor: MaterialStateProperty.all<Color>(
                form.valid ? blue : blueOpacity),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: form.valid ? onPressed : null,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 2, bottom: 2),
            child: Text(
              label,
              style: CawafTypographyStyle.body15.copyWith(
                color: form.valid ? white : whiteOpacity,
              ),
            ),
          ),
        );
      case StyleButton.back:
        return IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            size: 30,
            color: white,
          ),
        );
      default:
        return Container();
    }
  }
}
