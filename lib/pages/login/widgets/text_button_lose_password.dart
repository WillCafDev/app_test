import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/template/colors_manager.dart';
import '../../../../core/template/textstyle_manager.dart';

class TextButtonLosePasswordLogin extends StatelessWidget {
  const TextButtonLosePasswordLogin({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Text(
          'login.textLosePassword'.tr(),
          style: CawafTypographyStyle.body15.copyWith(
            color: blue,
            decoration: TextDecoration.underline,
          ),
        ),
      );
}
