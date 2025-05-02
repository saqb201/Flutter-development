import 'dart:convert';
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
  List<Photos> getlist = [];
  Future<List<Photos>> getlistapi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        // getlist.add(Photos.fromJson(i));
        getlist.add(photos);
      }
      return getlist;
    } else {
      return getlist;
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
            "Playing with Api part 2",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getlistapi(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  return ListView.builder(
                    itemCount: getlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            snapshot.data![index].url.toString(),
                          ),
                        ),
                        subtitle: Text(snapshot.data![index].title.toString()),
                        title: Text(snapshot.data![index].id.toString()),
                      );
                    },
                  );
                },
              ),
            ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: getlistapi(),
            //     builder: (context, snapshot) {
            //       return ListView.builder(
            //         itemCount: getlist.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(
            //               'Syed M Abdullah is on too ',
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
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
