abstract class ProductsSource {
  Future<List<dynamic>> getProducts();
  Future<List<dynamic>> getAllProducts();
  Future<Map<String, dynamic>> getProductDetails(String id);
}
