abstract class ProductsSource {
  Future<List<dynamic>> getProducts();
  Future<Map<String, dynamic>> getProductDetails(String id);
}
