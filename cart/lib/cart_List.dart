import 'package:cart/cart_model.dart';
import 'package:cart/cart_provider.dart';
import 'package:cart/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  DbHelper? dbHelper = DbHelper();
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
              return badges.Badge(
                showBadge: cart.counter > 0,
                badgeContent: Text(
                  cart.counter.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(Icons.shopping_cart),
              );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
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
                                    snapshot.data![index].productImage
                                        .toString(),
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(width: 15),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data![index].productName
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                dbHelper?.delete(
                                                  snapshot.data![index].id!,
                                                );
                                                cart.removeCounter();
                                                cart.removeTotalPrice(
                                                  double.parse(
                                                    snapshot.data![index]
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          '${snapshot.data![index].productUnit.toString()} - \$${snapshot.data![index].productPrice.toString()}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.lightGreenAccent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      int quantity = snapshot
                                                          .data![index]
                                                          .quantity!;
                                                      int price = snapshot
                                                          .data![index]
                                                          .initialPrice!;
                                                      quantity--;
                                                      int? newprice =
                                                          price * quantity;
                                                      if (quantity > 0) {
                                                        dbHelper
                                                            ?.updateQuantity(
                                                              Cart(
                                                                id: snapshot
                                                                    .data![index]
                                                                    .id!,
                                                                productId: snapshot
                                                                    .data![index]
                                                                    .productId!,
                                                                productName: snapshot
                                                                    .data![index]
                                                                    .productName!,
                                                                productImage: snapshot
                                                                    .data![index]
                                                                    .productImage!,
                                                                productUnit: snapshot
                                                                    .data![index]
                                                                    .productUnit!,
                                                                quantity:
                                                                    quantity,
                                                                initialPrice: snapshot
                                                                    .data![index]
                                                                    .initialPrice!,
                                                                productPrice:
                                                                    newprice,
                                                              ),
                                                            )
                                                            .then((value) {
                                                              quantity = 0;
                                                              newprice = 0;
                                                              cart.removeTotalPrice(
                                                                double.parse(
                                                                  snapshot
                                                                      .data![index]
                                                                      .initialPrice
                                                                      .toString(),
                                                                ),
                                                              );
                                                            })
                                                            .onError((
                                                              error,
                                                              StackTrace,
                                                            ) {
                                                              print(error);
                                                            });
                                                      } else {
                                                        print('cannot be less than 1');
                                                      }
                                                    },
                                                    child: Icon(Icons.remove),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      snapshot
                                                          .data![index]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      int quantity = snapshot
                                                          .data![index]
                                                          .quantity!;
                                                      int price = snapshot
                                                          .data![index]
                                                          .initialPrice!;
                                                      quantity++;
                                                      int? newprice =
                                                          price * quantity;
                                                      dbHelper
                                                          ?.updateQuantity(
                                                            Cart(
                                                              id: snapshot
                                                                  .data![index]
                                                                  .id!,
                                                              productId: snapshot
                                                                  .data![index]
                                                                  .productId!,
                                                              productName: snapshot
                                                                  .data![index]
                                                                  .productName!,
                                                              productImage: snapshot
                                                                  .data![index]
                                                                  .productImage!,
                                                              productUnit: snapshot
                                                                  .data![index]
                                                                  .productUnit!,
                                                              quantity:
                                                                  quantity,
                                                              initialPrice: snapshot
                                                                  .data![index]
                                                                  .initialPrice!,
                                                              productPrice:
                                                                  newprice,
                                                            ),
                                                          )
                                                          .then((value) {
                                                            quantity = 0;
                                                            newprice = 0;
                                                            cart.addTotalPrice(
                                                              double.parse(
                                                                snapshot
                                                                    .data![index]
                                                                    .initialPrice
                                                                    .toString(),
                                                              ),
                                                            );
                                                          })
                                                          .onError((
                                                            error,
                                                            StackTrace,
                                                          ) {
                                                            print(error);
                                                          });
                                                    },
                                                    child: Icon(Icons.add),
                                                  ),
                                                ],
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
                );
              } else {
                return Text('No Carted items');
              }
            },
          ),

          Consumer<CartProvider>(
            builder: (context, val, child) {
              return Column(
                children: [
                  ReuseableWidget(
                    title: 'Total Price ',
                    val: val.totalPrice.toStringAsFixed(2),
                  ),
                  ReuseableWidget(title: 'Total Items ', val: val.counter),
                ],
              );
            },
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
      padding: const EdgeInsets.all(10.0),
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
