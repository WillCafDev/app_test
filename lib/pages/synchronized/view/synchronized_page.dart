import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/template/colors_manager.dart';
import '../../../core/template/textstyle_manager.dart';
import '../../../core/utils/loader_river.dart';
import '../../../injection_container.dart';
import 'synchronized_vm.dart';

class SynchronizedPage extends StatefulWidget {
  const SynchronizedPage({Key? key}) : super(key: key);

  @override
  State<SynchronizedPage> createState() => _SynchronizedPageState();
}

class _SynchronizedPageState extends State<SynchronizedPage> {
  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<SynchronizedViewModel>(
        create: (BuildContext screenContext) => sl<SynchronizedViewModel>(),
        child: Scaffold(
          backgroundColor: blue,
          body: Consumer<SynchronizedViewModel>(
            builder: (_, SynchronizedViewModel synchronizedViewModel, __) =>
                Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: cawafLoader.build(),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Text(
                        '${synchronizedViewModel.descriptionProgress}[${synchronizedViewModel.progress}%]',
                        style: CawafTypographyStyle.body15.white.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          synchronizedViewModel.currentStatus ==
                                  StatusSynchronization.notInternet
                              ? 'No ha podido sincronizar la información por favor volver a intentar.'
                              : 'loaderConfig.content'.tr(),
                          style: CawafTypographyStyle.body13.white,
                          textAlign: TextAlign.center,
                        ),
                        if (synchronizedViewModel.currentStatus ==
                            StatusSynchronization.notInternet) ...<Widget>[
                          TextButton(
                            onPressed: () =>
                                synchronizedViewModel.mapEventToState(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: green,
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'Reintentar',
                                  style: CawafTypographyStyle.body13,
                                ),
                              ),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'login.reservedDescription'.tr(),
                        style: CawafTypographyStyle.body12.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
