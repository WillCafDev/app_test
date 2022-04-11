import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/template/colors_manager.dart';
import '../../../../core/template/textstyle_manager.dart';

class WelcomeLogin extends StatelessWidget {
  const WelcomeLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          'login.welcome'.tr(),
          style: CawafTypographyStyle.display30.copyWith(
            color: blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
