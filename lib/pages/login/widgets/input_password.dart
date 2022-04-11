import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/template/colors_manager.dart';
import '../../../../core/utils/input_text.dart';

class InputPasswordLogin extends StatelessWidget {
  const InputPasswordLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.lock_outline_rounded,
              color: grey,
              size: 35,
            ),
            SizedBox(width: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextInput(
                formControlName: 'password',
                hintText: 'login.hintPassword'.tr(),
                obscureText: true,
              ),
            ),
          ],
        ),
      );
}
