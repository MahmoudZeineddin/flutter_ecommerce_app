import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';

class ProductModel {
  final String productTitle;
  final double productPrice;
  final double productOriginalPrice;

  ProductModel({
    required this.productTitle,
    required this.productPrice,
    required this.productOriginalPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productTitle: json['productTitle'] ?? '',
      productPrice: (json['productPrice'] as num).toDouble(),
      productOriginalPrice: (json['productOriginalPrice'] as num).toDouble(),
    );
  }
}

class AmazonApiClient {
  late final Dio _dio;

  AmazonApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://${AppConstants.host}',

        connectTimeout: const Duration(
          seconds: 10,
        ), // Time to open the connection
        receiveTimeout: const Duration(
          seconds: 10,
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
    } on DioException catch (e) {
      throw _handleError(e);
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
      return products.map((product) => ProductModel.fromJson(product)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
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
      return products.map((product) => ProductModel.fromJson(product)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<ProductModel>> fetchDeals({
    required String category,
    String country = 'US',
  }) async {
    try {
      final response = await _dio.get(
        AppConstants.bestSellersEndpoint,
        queryParameters: {'category': category, 'country': country},
      );
      final products = response.data['data']['deals'] as List;
      return products.map((product) => ProductModel.fromJson(product)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
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
