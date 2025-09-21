import 'package:flutter/material.dart';
import 'package:mvvm/utilities/routes/routes_names.dart';
import 'package:mvvm/utilities/utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // Navigator.pushNamed(context, RoutesNames.login);
              Utilities.toastMessage('Hello');
              Utilities.flushbarErrorMessage("No internet Connection", context);
            },
            child: Center(child: Text('Click')),
          ),
        ],
      ),
    );
  }
}
