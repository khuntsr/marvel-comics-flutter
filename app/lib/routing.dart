import 'package:app/views/auth/login.dart';
import 'package:app/views/auth/register.dart';
import 'package:app/views/home/home.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
