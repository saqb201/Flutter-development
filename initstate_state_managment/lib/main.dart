import 'package:flutter/material.dart';
import 'package:initstate_state_managment/provider/count_provider.dart';
import 'package:initstate_state_managment/provider/example_one_provider_.dart';
import 'package:initstate_state_managment/provider/fav_provider.dart';
import 'package:initstate_state_managment/provider/theme_provider.dart';
import 'package:initstate_state_managment/screen/theme_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     body: Whyprovider(),
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavItem()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: "Flutter demo",
            themeMode: themeProvider.thememode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
              ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.red,

            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: ThemeScreen()),
          );
        },
      ),
    );
  }
}
