import 'dart:convert';
// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  Future<void> userapiget() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Playing with Api part 4",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: userapiget(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Reusable(
                                  value: data![index]['name'].toString(),
                                  title: 'name',
                                ),

                                // Reusable(
                                //   value: data![index]['address'].toString(),
                                //   title: 'Address',
                                // ),
                                Reusable(
                                  value:
                                      data![index]['address']['geo']['lat']
                                          .toString(),
                                  title: 'Lat',
                                ),
                                Reusable(
                                  value: data![index]['username'].toString(),
                                  title: 'Username',
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photos {
  String url, title;
  int id;
  Photos({required this.title, required this.url, required this.id});
}

// ignore: must_be_immutable
class Reusable extends StatelessWidget {
  String title, value;
  Reusable({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
