import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/template/colors_manager.dart';
import '../../../../core/template/textstyle_manager.dart';

class TextButtonRegisterLogin extends StatelessWidget {
  const TextButtonRegisterLogin({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Text(
          'login.buttonRegister'.tr(),
          style: CawafTypographyStyle.body15.copyWith(
            color: blue,
            decoration: TextDecoration.underline,
          ),
        ),
      );
}
