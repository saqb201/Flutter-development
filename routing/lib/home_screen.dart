import 'package:flutter/material.dart';
import 'package:routing/route_names.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homescreen';
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
              Navigator.pushNamed(context, RouteNames.screen1);
            },
            child: Center(
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple,
                ),
                child: Center(child: Text("Navigate")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
