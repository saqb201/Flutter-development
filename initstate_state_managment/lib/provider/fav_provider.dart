import 'package:flutter/foundation.dart';

class FavItem with ChangeNotifier {
  final List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(int val) {
    _selectedItem.add(val);
    notifyListeners();
  }

  void removeItem(int val) {
    _selectedItem.remove(val);
    notifyListeners();
  }
  
}
