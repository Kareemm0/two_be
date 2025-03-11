import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/core/constant/end_points.dart';

import '../../../../../core/network/dio/base_dio.dart';
import '../base/products_source.dart';

class ProductsSourceImpl implements ProductsSource {
  final BaseDio _dio;

  ProductsSourceImpl(this._dio);
  @override
  Future<List> getProducts({int page = 1, int perPagecount = 100}) async {
    try {
      final response = await _dio.get(EndPoints.products, queryParameters: {
        perPage: perPagecount,
        'page': page,
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> getAllProducts() async {
    List<dynamic> allProducts = [];
    int page = 1;
    bool hasMore = true;
    const int initialPerPageCount = 100;
    int perPageCount = initialPerPageCount;

    try {
      final firstPageProducts =
          await getProducts(page: page, perPagecount: perPageCount);
      if (firstPageProducts.isNotEmpty) {
        allProducts.addAll(firstPageProducts);
        page++;
      } else {
        hasMore = false;
      }
    } catch (e) {
      rethrow;
    }

    while (hasMore) {
      try {
        final futures = List.generate(
            5, (i) => getProducts(page: page + i, perPagecount: perPageCount));
        final results = await Future.wait(futures);

        bool emptyPageFound = false;
        for (final products in results) {
          if (products.isEmpty) {
            emptyPageFound = true;
            break;
          }
          allProducts.addAll(products);
        }

        if (emptyPageFound) {
          hasMore = false;
        } else {
          page += results.length;
        }
      } catch (e) {
        rethrow;
      }
    }

    return allProducts;
  }

  @override
  Future<Map<String, dynamic>> getProductDetails(String id) async {
    try {
      final reponse =
          await _dio.get(EndPoints.productsDetails(id), queryParameters: {
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret,
      });
      return reponse.data;
    } catch (e) {
      rethrow;
    }
  }
}
