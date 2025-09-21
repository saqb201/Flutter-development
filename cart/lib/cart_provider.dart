// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'cart_model.dart';

// class CartProvider with ChangeNotifier {
//   int _counter = 0;
//   get counter => _counter;

//   double _totalPrice = 0.0;
//   get totalprice => _totalPrice;

//   void _setPrefItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt("cart_items", counter);
//     prefs.setDouble("total_price", totalprice);
//     notifyListeners();
//   }

//   void _getprefItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _counter = prefs.getInt('cart_items') ?? 0;
//     _totalPrice = prefs.getDouble('total_price') ?? 0.0;
//     notifyListeners();
//   }

//   void Addcounter() {
//     _counter++;
//     _setPrefItems();
//     notifyListeners();
//   }

//   void removeCounter() {
//     _counter--;
//     _setPrefItems();
//     notifyListeners();
//   }

//   int getCounter() {
//     _getprefItems();
//     return _counter;
//   }

//   void addTotalprice(double productPrice) {
//     _totalPrice = _totalPrice + productPrice;
//     _setPrefItems();
//     notifyListeners();
//   }

//   void RemoveTotalprice(double productPrice) {
//     _totalPrice = _totalPrice - productPrice;
//     _setPrefItems();
//     notifyListeners();
//   }

//   double getTotalprice() {
//     _getprefItems();
//     return _totalPrice;
//   }
// }

import 'package:cart/cart_model.dart';
import 'package:cart/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  double _totalPrice = 0.0;
  DbHelper db = DbHelper();
  int get counter => _counter;
  double get totalPrice => _totalPrice;

  List<Cart> _cart = []; // ✅ this is the correct type

  List<Cart> get cart => _cart; // ✅ this matches

  Future<List<Cart>> getData() async {
    _cart = await DbHelper().getCartList(); // ✅ this now works
    return _cart;
  }



  CartProvider() {
    _loadPrefs();
  }

  // Load saved values when provider is initialized
  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    debugPrint('Loaded prefs: counter=$_counter, total=$_totalPrice');
    notifyListeners(); // Update UI after loading
  }

  // Save values to SharedPreferences
  Future<void> _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("cart_items", _counter);
    await prefs.setDouble("total_price", _totalPrice);
    debugPrint('Saved prefs: counter=$_counter, total=$_totalPrice');
  }

  // Public methods to modify state
  void addCounter() async {
    _counter++;
    await _savePrefs();
    notifyListeners();
  }

  void removeCounter() {
    if (_counter > 0) {
      _counter--;
      _savePrefs();
      notifyListeners();
    }
  }

  void addTotalPrice(double price) async {
    _totalPrice += price;
    await _savePrefs();
    notifyListeners();
  }

  void removeTotalPrice(double price) {
    _totalPrice -= price;
    _savePrefs();
    notifyListeners();
  }

  void resetCart() async {
    _counter = 0;
    _totalPrice = 0.0;
    await _savePrefs();
    notifyListeners();
  }

  // Existing imports and class definition


  // Existing methods and prope
}

