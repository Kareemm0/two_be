abstract class CartSource {
  Future<Map<String, dynamic>> addToCart({
    required String productId,
    int quantity = 1,
  });
}
