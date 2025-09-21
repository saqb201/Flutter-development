class Cart {
  late final int? id;
  final String? productName;
  final String? productImage;
  final String? productUnit;
  final int? productId;
  final int? initialPrice;
  final int? productPrice;
  final int? quantity;

  Cart({
    this.id,
    this.productName,
    this.productImage,
    this.productUnit,
    this.productId,
    this.initialPrice,
    this.productPrice,
    this.quantity,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productName = res['productName'],
        productImage = res['productImage'],
        productUnit = res['productUnit'],
        productId = res['productId'],
        initialPrice = res['initialPrice'],
        productPrice = res['productPrice'],
        quantity = res['quantity'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productName': productName,
      'productImage': productImage,
      'productUnit': productUnit,
      'productId': productId,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
    };
  }
}
