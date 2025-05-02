import 'dart:convert';
import 'package:first_flutter_project_in_vs_code/json_model.dart';
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
  List<PostModel> postlist = [];
  Future<List<PostModel>> getPostapi() async {
    // ignore: non_constant_identifier_names
    final Response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    var data = jsonDecode(Response.body.toString());
    postlist.clear();
    if (Response.statusCode == 200) {
      for (var i in data) {
        postlist.add(PostModel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Playing with Api part 1",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading Please w8");
                  } else {
                    return ListView.builder(
                      itemCount: postlist.length,
                      itemBuilder: (context, index) {
                        return
                        // this is used to display the numer of items or objects are in api is could be in array
                        // Text(index.toString());
                        // this is used to display the content of the display title from the api we are fetching
                        // Text(postlist[index].title.toString());
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title \n${postlist[index].title}'),
                                Text('Description\n${postlist[index].title}'),
                              ],
                            ),
                          ),
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
