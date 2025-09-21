import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/utilities/routes/routes_names.dart';
import 'package:mvvm/views/home_screen.dart';
import 'package:mvvm/views/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('No routes Defined')));
          },
        );
    }
  }
}
