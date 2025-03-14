abstract class ProductsSource {
  Future<List<dynamic>> getProducts(
      {required int page, required int perPagecount});
  Future<Map<String, dynamic>> getProductDetails(String id);
}
