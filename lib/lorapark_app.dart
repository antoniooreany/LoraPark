import 'package:get_it/get_it.dart';
import 'package:lorapark_app/config/router/application.dart';
import 'package:lorapark_app/screens/screens.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:fluro/fluro.dart';
import 'package:lorapark_app/themes/lorapark_theme.dart';
import 'package:provider/provider.dart';
import 'package:lorapark_app/services/services.dart';
import 'package:lorapark_app/utils/utils.dart'
    show DisableScrollGlow, hideKeyboardOnTap;

class LoRaParkApp extends StatefulWidget {
  @override
  _LoRaParkAppState createState() => _LoRaParkAppState();
}

class _LoRaParkAppState extends State<LoRaParkApp> {
  Router router;

  @override
  void initState() {
    super.initState();
    router = Router();
    Application.router = router;
    Application.navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return hideKeyboardOnTap(
        child: MultiProvider(
            // Add all your providers here!
            providers: [
          ChangeNotifierProvider(create: (_) => GetIt.I.get<AuthService>()),
        ],
            child: MaterialApp(
              builder: (_, child) => ScrollConfiguration(
                behavior: DisableScrollGlow(),
                child: child,
              ),
              debugShowCheckedModeBanner: false,
              title: 'LoRaPark',
              theme: LoraParkTheme.themeData,
              home: Init(),
            )));
  }
}
