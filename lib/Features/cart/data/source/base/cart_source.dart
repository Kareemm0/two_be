abstract class CartSource {
  Future<Map<String, dynamic>> addToCart({
    required String productId,
    int quantity = 1,
  });
  Future<Map<String, dynamic>> getCart();

  Future<Map<String, dynamic>> createOrder({
    String? paymentMehthod,
    String? customerName,
    String? customerPhone,
    String? customerEmail,
    String? address,
    String? city,
    String? state,
    List<Map<String, dynamic>>? lineItems,
  });

  Future<dynamic> deleteItemFromCart({
    required String productKey,
  });
}
