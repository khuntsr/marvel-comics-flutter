
import 'package:app/routing.dart';
import 'package:app/views/auth/login.dart';
import 'package:app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'helpers/session.dart';
import 'helpers/static-data.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: DefaultColors.dark,
        statusBarColor: DefaultColors.dark,
      ),
    );

    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: DefaultColors.primary,
        splashColor: DefaultColors.dark,
        textTheme: TextTheme(
          labelSmall: TextStyle(color: DefaultColors.dark, fontWeight: FontWeight.bold , fontSize: 14),
          labelMedium: TextStyle(color: DefaultColors.dark, fontWeight: FontWeight.bold , fontSize: 14),
          labelLarge: TextStyle(color: DefaultColors.dark, fontWeight: FontWeight.bold , fontSize: 14),
          displaySmall: TextStyle(color: DefaultColors.dark, fontSize: 12),
          displayMedium: TextStyle(color: DefaultColors.dark, fontSize: 14),
          displayLarge: TextStyle(color: DefaultColors.dark, fontSize: 16),
          bodySmall:  TextStyle(color: DefaultColors.grey, fontSize: 12),
          bodyMedium: TextStyle(color: DefaultColors.grey, fontSize: 14),
          bodyLarge: TextStyle(color: DefaultColors.grey, fontSize: 16),
        )
      ),
      home: FutureBuilder(
        future: IsPermissionGranted(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            if (snapshot.data == 1) {
              return LoginScreen();
            } else {
              return HomeScreen();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
