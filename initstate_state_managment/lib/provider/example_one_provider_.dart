import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _value = 1.0;

  double get value => _value;

  void setexample(double val) {
    _value = val;
    notifyListeners();
  }
}
