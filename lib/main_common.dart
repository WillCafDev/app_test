import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'core/services_sl/enviroments.dart';
import 'injection_container.dart' as di;

Future<void> mainCommon(String env) async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init(env);

  bool? banner;
  switch (env) {
    case Environment.dev:
      banner = true;
      break;
    case Environment.prod:
      banner = false;
      break;
  }

  runApp(
    EasyLocalization(
      supportedLocales: <Locale>[
        Locale('es', ''),
        Locale('en', ''),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('es', null),
      child: MyApp(banner: banner!),
    ),
  );
}
