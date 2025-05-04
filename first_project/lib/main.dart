import 'dart:convert';
// import 'dart:developer';
import 'package:first_flutter_project_in_vs_code/Models/product_api.dart';
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
  Future<ProductsModel> getproductapi() async {
    final response = await http.get(
      Uri.parse('https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7'),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
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
            "Playing with Api part 4",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getproductapi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                  title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                  subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                  ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * .1,
                                child: ListView.builder(
                                  itemCount:
                                      snapshot
                                          .data!
                                          .data![index]
                                          .images!
                                          .length,
                                  itemBuilder: (context, position) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            25,
                                        width:
                                            MediaQuery.of(context).size.width *
                                            .9,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              snapshot
                                                  .data!
                                                  .data![index]
                                                  .images![position]
                                                  .url
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    
                                    );
                                  },
                                ),
                              ),
                              Icon(snapshot.data!.data![index].inWishlist! == true? Icons.favorite : Icons.favorite_outline),
                            ],
                          );
                        },
                      );
                    } else {
                      return Text('Loading ...');
                    }
                  },
                ),
              ),
            ],
          ),
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
