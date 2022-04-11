import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/routes/route_manager.dart';
import '../../../../core/template/colors_manager.dart';
import '../../../../core/template/strings_manager.dart';
import '../../../../core/template/textstyle_manager.dart';
import '../../../../core/utils/button_cawaf.dart';
import '../../../../core/utils/line_painter.dart';
import '../../../../core/utils/logo.dart';
import '../../../../core/utils/navigator_utils.dart';
import '../../../../injection_container.dart';
import '../view.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<LoginViewModel>(
        create: (_) => sl<LoginViewModel>(),
        child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: CustomPaint(
              painter: LinePainter(),
              child: Consumer<LoginViewModel>(
                builder: (_, LoginViewModel loginViewModel, __) => Padding(
                  padding: const EdgeInsets.only(
                      left: 34, right: 34, top: 0, bottom: 0),
                  child: ReactiveForm(
                    formGroup: loginController.loginForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 180),
                        Logo(),
                        WelcomeLogin(),
                        InputUserLogin(),
                        SizedBox(height: 16),
                        InputPasswordLogin(),
                        SizedBox(height: 16),
                        ButtonCawaf(
                          onPressed: () => loginController.loginForm.valid
                              ? loginViewModel.login()
                              : null,
                          label: 'login.buttonLogin'.tr(),
                          styleButton: StyleButton.primaryBlue,
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            TextButtonRegisterLogin(
                                onTap: () =>
                                    pushToPage(context, AppRoutes.register)),
                            TextButtonLosePasswordLogin(
                              onTap: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 38),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'login.reservedDescription'.tr(),
                                  style: CawafTypographyStyle.body12.copyWith(
                                    color: grey,
                                  ),
                                ),
                                Text(
                                  appVersion,
                                  style: CawafTypographyStyle.body12.copyWith(
                                    color: white,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
