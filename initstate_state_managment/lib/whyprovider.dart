import 'dart:async';

import 'package:flutter/material.dart';

class Whyprovider extends StatefulWidget {
  const Whyprovider({super.key});

  @override
  State<Whyprovider> createState() => _WhyproviderState();
}

class _WhyproviderState extends State<Whyprovider> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);

      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("S M Saqib")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}", style: TextStyle(fontSize: 50))),
          Center(child: Text(count.toString(), style: TextStyle(fontSize: 50))),
        ],
      ),
    );
  }
}
