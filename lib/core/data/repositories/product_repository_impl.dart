import 'package:flutter_ecommerce_app/core/data/data_sources/remote/amazon/amazon_api_client.dart';
import 'package:flutter_ecommerce_app/core/data/models/category_model.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter_ecommerce_app/core/domain/repositories/product_repository.dart';

// connect the interface to the actual API client.
/*
Cubit = Business Logic (What)
Repository = Data Access (How)
ApiClient = Implementation Details (Where)

ApiClient = Delivery Driver
Knows streets (HTTP)
Delivers packages (API calls)
No decisions, just transport

Repository = Store Manager
Decides: Call driver? Use stock? Return old items?
Business decisions
Orchestrates multiple sources
*/
class ProductRepositoryImpl implements ProductRepository {
  final AmazonApiClient _apiClient;

  ProductRepositoryImpl(AmazonApiClient apiClient) : _apiClient = apiClient;

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

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await _apiClient.fetchCategories();
  }
}
