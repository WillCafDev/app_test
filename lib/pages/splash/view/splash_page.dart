import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/template/colors_manager.dart';
import '../../../core/template/textstyle_manager.dart';
import '../../../core/utils/loader_river.dart';
import 'splash_vm.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<SplashViewModel>(
        builder: (_, SplashViewModel baseViewModel, __) => Scaffold(
          backgroundColor: blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: cawafLoader.build()),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'cawafApp.name'.tr(),
                    style: CawafTypographyStyle.display30.copyWith(
                      color: Colors.grey[100],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
