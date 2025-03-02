abstract class HomeSource {
  Future<List<dynamic>> getCategory();
  Future<List<dynamic>> getBanners();
  Future<dynamic> favorite({
    required String productId,
  });
}
