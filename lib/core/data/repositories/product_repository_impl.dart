import 'package:flutter_ecommerce_app/core/data/data_sources/remote/amazon/amazon_api_client.dart';
import 'package:flutter_ecommerce_app/core/domain/repositories/product_repository.dart';

// connect the interface to the actual API client.

class ProductRepositoryImpl implements ProductRepository {
  final AmazonApiClient _apiClient;

  @override
  Future<ProductModel> getProductDetails({
    required String asin,
    String country = 'US',
  }) async {
    return await _apiClient.fetchProducts();
  }

  @override
  Future<List<ProductModel>> searchProducts({
    required String query,
    String country = 'US',
    int page = 1,
    String sortBy = 'RELEVANCE',
  }) async {
    return await _apiClient.searchProducts(
      query: query,
      country: country,
      page: page,
      sortBy: sortBy,
    );
  }

  ProductRepositoryImpl({required AmazonApiClient apiClient})
    : _apiClient = apiClient;
  @override
  Future<List<ProductModel>> getBestSellers({
    required String category,
    String country = 'US',
  }) async {
    return await _apiClient.fetchBestSellers(
      category: category,
      country: country,
    );
  }

  @override
  Future<List<ProductModel>> getDeals({
    required String category,
    String country = 'US',
  }) async {
    return await _apiClient.fetchDeals(category: category, country: country);
  }
}
