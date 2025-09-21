import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  // Your AuthProvider implementation

  bool _loading = false;
  bool get loading => _loading;

  bool _visibility = false;
  bool get visibility => _visibility;

  setVisibility(bool value) {
    _visibility = value;
    notifyListeners();
  }

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);

    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      if (response.statusCode == 200) {
        print("Login Successful");
        setLoading(false);
      } else {
        setLoading(false);
        print("Login Failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
