import 'dart:async';

import 'package:flutter/material.dart';
import 'package:initstate_state_managment/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setcount();
    });
  }

  @override
  Widget build(BuildContext context) {
    // this countProvider provides access the floating button onpressed function it's setcount function to execute on pressed
    // final countProvider = Provider.of<CountProvider>(context, listen: false);
    // print("build"); it will build until consumer's function is not applied other wise their is no difference between the statefullwidget and provider as they both build whole project again and again , so the consumer function tell that only this function is needed to be rebuild nothing else and makes program alot more efficient especially bigger ones
    return Scaffold(
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print("hello");
            return Text(value.count.toString());
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     countProvider.setcount();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
