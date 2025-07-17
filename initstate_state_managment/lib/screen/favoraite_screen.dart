// import 'package:flutter/material.dart';

// class FavoraiteScreen extends StatefulWidget {
//   const FavoraiteScreen({super.key});

//   @override
//   State<FavoraiteScreen> createState() => _FavoraiteScreenState();
// }

// class _FavoraiteScreenState extends State<FavoraiteScreen> {
//   List<int> selectedItem = [];
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Provider Control"),
//         backgroundColor: Colors.amberAccent,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: () {
//                     selectedItem.add(index);
//                     setState(() {});
//                   },
//                   title: Text('item: $index'),
//                   trailing: Icon(
//                     selectedItem.contains(index)
//                         ? Icons.favorite
//                         : Icons.favorite_outline,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:initstate_state_managment/provider/fav_provider.dart';
import 'package:initstate_state_managment/screen/my_favoraite.dart';
import 'package:provider/provider.dart';

class FavoraiteScreen extends StatefulWidget {
  const FavoraiteScreen({super.key});

  @override
  State<FavoraiteScreen> createState() => _FavoraiteScreenState();
}

class _FavoraiteScreenState extends State<FavoraiteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider = Provider.of<FavItem>(context);
    print("built");
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
              itemCount: 100,
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
                      trailing: 
                      Icon(
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
