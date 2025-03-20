abstract class CartSource {
  Future<Map<String, dynamic>> addToCart({
    required String productId,
    int quantity = 1,
  });
  Future<Map<String, dynamic>> getCart();

  Future<Map<String, dynamic>> createOrder();

  Future<dynamic> deleteItemFromCart({
    required String productKey,
  });
}
