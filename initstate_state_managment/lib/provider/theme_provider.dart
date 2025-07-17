import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _thememode = ThemeMode.light;
  ThemeMode get thememode => _thememode;

  void themeChanger(thememode) {
    _thememode = thememode;

    notifyListeners();
  }
}
