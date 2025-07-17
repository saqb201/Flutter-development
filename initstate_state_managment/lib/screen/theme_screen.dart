import 'package:flutter/material.dart';
import 'package:initstate_state_managment/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Themes")),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: themeProvider.thememode,
            onChanged: themeProvider.themeChanger,
          ),
          RadioListTile<ThemeMode>(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeProvider.thememode,
            onChanged: themeProvider.themeChanger,
          ),
        ],
      ),
    );
  }
}
