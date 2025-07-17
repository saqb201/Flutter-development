import 'package:flutter/material.dart';
import 'package:initstate_state_managment/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class MyFavoraiteScreens extends StatefulWidget {
  const MyFavoraiteScreens({super.key});

  @override
  State<MyFavoraiteScreens> createState() => _MyFavoraiteScreensState();
}

class _MyFavoraiteScreensState extends State<MyFavoraiteScreens> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Control"),
        backgroundColor: Colors.amberAccent,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFavoraiteScreens()),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavItem>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('item: $index'),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
