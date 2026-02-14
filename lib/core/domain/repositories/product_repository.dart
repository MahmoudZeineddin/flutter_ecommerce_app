import 'package:flutter_ecommerce_app/core/data/data_sources/remote/amazon/amazon_api_client.dart';

// what data we need
abstract class ProductRepository {
  Future<List<ProductModel>> searchProducts({
    required String query,
    String country = 'US',
    int page = 1,
    String sortBy = 'RELEVANCE',
  });

  Future<List<ProductModel>> getBestSellers({
    required String category,
    String country = 'US',
  });

  Future<List<ProductModel>> getDeals({
    required String category,
    String country = 'US',
  });

  Future<ProductModel> getProductDetails({
    required String asin,
    String country = 'US',
  });
}
