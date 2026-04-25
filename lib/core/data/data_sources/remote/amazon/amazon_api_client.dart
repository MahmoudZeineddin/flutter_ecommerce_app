import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter_ecommerce_app/core/data/models/category_model.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';

class AmazonApiClient {
  late final Dio _dio;

  AmazonApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://${AppConstants.host}',

        connectTimeout: const Duration(
          seconds: 30,
        ), // Time to open the connection
        receiveTimeout: const Duration(
          seconds: 30,
        ), // Time to receive data chunks
        headers: {
          'X-RapidAPI-Key': AppConstants.apiKey,
          'X-RapidAPI-Host': AppConstants.host,
        },
      ),
    );
  }

  Future<ProductModel> fetchProducts() async {
    try {
      final response = await _dio.get(
        AppConstants.detailsEndpoint,
        queryParameters: {'asin': 'B07ZPKBL9V', 'country': 'US'},
      );

      final dataJson = response.data['data'] as Map<String, dynamic>;
      return ProductModel.fromJson(dataJson);

      // return dummyProducts;
    } on DioException catch (e) {
      return ProductModel(asin: '', productTitle: '', productPrice: 0.0);
      // throw _handleError(e);
    }
  }

  Future<List<ProductModel>> searchProducts({
    required String query,
    String country = 'US',
    String sortBy = 'RELEVANCE', // LOWEST_PRICE, HIGHEST_PRICE, REVIEWS, NEWEST
    int page =
        1, // 'page': Enables pagination to load product sets in small chunks.
  }) async {
    try {
      final response = await _dio.get(
        AppConstants.searchEndpoint,
        queryParameters: {
          'query': query,
          'country': country,
          'page': page,
          'sort_by': sortBy,
        },
      );
      final products = response.data['data']['products'] as List;
      // return products.map((product) => ProductModel.fromJson(product)).toList();
      return dummyProducts;
    } on DioException catch (e) {
      return dummyProducts;
      // throw _handleError(e);
    }
  }

  Future<List<ProductModel>> fetchBestSellers({
    required String category,
    String country = 'US',
  }) async {
    try {
      final response = await _dio.get(
        AppConstants.bestSellersEndpoint,
        queryParameters: {'category': category, 'country': country},
      );
      final products = response.data['data']['best_sellers'] as List;
      // return products.map((product) => ProductModel.fromJson(product)).toList();
      return dummyProducts;
    } on DioException catch (e) {
      return [];
      // throw _handleError(e);
    }
  }

  Future<List<ProductModel>> fetchDeals({
    required String category,
    String country = 'US',
  }) async {
    try {
      final response = await _dio.get(
        AppConstants.dealsEndpoint,
        queryParameters: {'category': category, 'country': country},
      );
      final data = response.data['data'];
      // print('deals data: $data');

      final deals = (response.data['data']['deals'] as List?) ?? [];
      // return deals
      //     .map(
      //       (deal) => ProductModel(
      //         asin: deal['product_asin'] ?? '',
      //         productTitle: deal['deal_title'] ?? '',
      //         productPhoto: deal['deal_photo'],
      //         productPrice: (deal['deal_price']['amount'] as num).toDouble(),
      //         productOriginalPrice: (deal['list_price']['amount'] as num)
      //             .toDouble(),
      //       ),
      //     )
      //     .toList();
      return dummyProducts;
    } on DioException catch (e) {
      // print("Error fetching deals: ${e.message}");
      // throw _handleError(e);
      return [];
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get(AppConstants.categoriesEndpoint);
      final categories = response.data['data'] as List;
      // return categories
      //     .map((category) => CategoryModel.fromJson(category))
      //     .toList();
      return [];
    } on DioException catch (e) {
      // throw _handleError(e);
      return [];
    }
  }

  Exception _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return Exception('Connection timeout - check your internet');
    } else if (e.type == DioExceptionType.badResponse) {
      return Exception('API Error: ${e.response?.statusCode}');
    } else {
      return Exception('Network error: ${e.message}');
    }
  }
}
