
import 'package:app/routing.dart';
import 'package:app/views/auth/login.dart';
import 'package:app/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/static-data.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
      // theme: ThemeData(
      //   primaryColor: DefaultColors.primary,
      //   splashColor: DefaultColors.dark,
      //   scaffoldBackgroundColor: DefaultColors.baby_white,
      //   textSelectionTheme: TextSelectionThemeData(cursorColor: DefaultColors.dark, selectionColor: DefaultColors.dark, selectionHandleColor: DefaultColors.secondary),
      //   fontFamily: GoogleFonts.dmSans().fontFamily,
      //   //primarySwatch: MaterialColor(0xFFFFFFFF, secondaryMaterial),
      //   textTheme: TextTheme(
      //     bodySmall: TextStyle(color: DefaultColors.dark, fontSize: 12),
      //     bodyMedium: TextStyle(color: DefaultColors.dark, fontSize: 14),
      //     bodyLarge: TextStyle(color: DefaultColors.dark, fontSize: 16),
      //     headlineLarge: TextStyle(color: DefaultColors.dark, fontSize: 24, fontWeight: FontWeight.w500),
      //     displaySmall: TextStyle(color: DefaultColors.grey_dark, fontSize: 12),
      //     displayMedium: TextStyle(color: DefaultColors.grey_dark, fontSize: 14),
      //     displayLarge: TextStyle(color: DefaultColors.grey_dark, fontSize: 16),
      //   ),
      // ),
      // home: FutureBuilder(
      //   future: IsPermissionGranted(),
      //   builder: (context, snapshot) {
      //     if (snapshot.data != null) {
      //       if (snapshot.data == 1) {
      //         return LoginScreen();
      //       } else {
      //         return DashboardScreen();
      //       }
      //     } else {
      //       return LoginScreen();
      //     }
      //   },
      // ),
      home: RegisterScreen(),
    );
  }
}
