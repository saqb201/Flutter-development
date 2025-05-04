import 'dart:convert';
// import 'dart:developer';
import 'package:first_flutter_project_in_vs_code/Models/user_model.dart';
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
  List<UsersModel> userlist = [];
  Future<List<UsersModel>> userapi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in data) {
        userlist.add(UsersModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Playing with Api part 3",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: userapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Reusable(
                              value: snapshot.data![index].name.toString(),
                              title: "Name",
                            ),
                            //  SizedBox(height: 5,),
                            Reusable(
                              value: snapshot.data![index].username.toString(),
                              title: "Username",
                            ),
                            // SizedBox(height: 5,),
                            Reusable(
                              value: snapshot.data![index].email.toString(),
                              title: "Email",
                            ),
                            Reusable(
                              value:
                                  snapshot.data![index].address!.city
                                      .toString(),
                              title: "City",
                            ),
                            SizedBox(height: 20),
                          ],
                        );
                      },
                    );
                  }
                },
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
