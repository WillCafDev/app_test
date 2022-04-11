import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/routes/route_manager.dart';
import 'core/services_sl/context_global.dart';
import 'core/services_sl/inactive_logout.dart';
import 'core/template/colors_manager.dart';
import 'core/template/strings_manager.dart';
import 'injection_container.dart';
import 'pages/splash/view.dart';

class MyApp extends StatefulWidget {
  const MyApp({required this.banner, Key? key}) : super(key: key);
  final bool banner;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //_logoutService = InactiveLogoutService();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  InactiveLogoutService? _logoutService;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<SplashViewModel>(
          create: (BuildContext screenContext) => sl<SplashViewModel>(),
        ),
      ],
      child: Listener(
        onPointerDown: (_) {
          if (_logoutService != null) {
            _logoutService!.handleUserInteraction();
          }
        },
        child: MaterialApp(
          navigatorKey: sl<ContextService>().navigatorKey,
          debugShowCheckedModeBanner: widget.banner,
          title: appName,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              splashColor: Colors.white,
              //brightness: Brightness.dark,
              fontFamily: 'Montserrat',
              canvasColor: blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SplashPage(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: RouteManager.generateRoute,
          //initialRoute: RouteManager.initial,
        ),
      ),
    );
  }
}
