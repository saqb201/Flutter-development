import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'cart_model.dart';

class DbHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await InitDatabase();
    return _db;
  }

  Future<Database?> InitDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('''
    CREATE TABLE cart (
      id INTEGER PRIMARY KEY,
      productName TEXT,
      productImage TEXT,
      productUnit TEXT,
      productId INTEGER,
      initialPrice INTEGER,
      productPrice INTEGER,
      quantity INTEGER
    )
  ''');
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult = await dbClient!.query(
      "cart",
    );

    // FIX: this returns a List<Cart>
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

   Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient!.update('cart', cart.toMap(), where: 'id = ?', whereArgs: [cart.id]);
  }
}
