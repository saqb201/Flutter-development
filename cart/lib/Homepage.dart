import 'package:cart/cart_List.dart';
import 'package:cart/cart_model.dart';
import 'package:cart/cart_provider.dart';
import 'package:cart/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DbHelper? dbHelper = DbHelper();
  List<String> productName = ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes'];
  List<int> productPrices = [100, 50, 200, 80, 150];
  List<String> productImages = [
    'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
    'https://images.unsplash.com/photo-1635716279493-d1e30afc25a0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1528825871115-3581a5387919?q=80&w=415&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1506806732259-39c2d0268443',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
  ];
  List<String> productUnit = ['KG', 'DOZEN', 'KG', 'DOZEN', 'KG'];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartList()),
                  );
                },
                child: Center(
                  child: badges.Badge(
                    showBadge: cart.counter > 0,
                    badgeContent: Text(
                      cart.counter.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              productImages[index],
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName[index].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${productUnit[index]} - \$${productPrices[index]}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        dbHelper!
                                            .insert(
                                              Cart(
                                                productId: index,
                                                productName: productName[index],
                                                productImage:
                                                    productImages[index],
                                                productUnit: productUnit[index],
                                                initialPrice:
                                                    productPrices[index],
                                                productPrice:
                                                    productPrices[index],
                                                quantity: 1,
                                              ),
                                            )
                                            .then((value) {
                                              print('Product Added to Cart');
                                              cart.addCounter();
                                              cart.addTotalPrice(
                                                productPrices[index].toDouble(),
                                              );
                                            })
                                            .onError((error, stackTrace) {
                                              print(error.toString());
                                            });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreenAccent,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add to Cart",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReuseableWidget extends StatelessWidget {
  final title, val;
  const ReuseableWidget({required this.title, required this.val, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          Text(val.toString(), style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
