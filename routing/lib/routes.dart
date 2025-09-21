import 'package:flutter/material.dart';
import 'package:routing/home_screen.dart';
import 'package:routing/route_names.dart';
import 'package:routing/screen_1.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.screen1:
        return MaterialPageRoute(builder: (context) => Screen1());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Text("Error");
          },
        );
    }
  }
}
