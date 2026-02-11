import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  final String apiKey;
  static const String host = 'real-time-amazon-data.p.rapidapi.com';

  AmazonApiClient({required this.apiKey});
  Future<ProductModel> fetchTestProducts() async {
    final uri = Uri.https(host, '/product-details', {
      'asin': 'B07ZPKBL9V',
      'country': 'US',
    });
    final response = await http.get(
      uri,
      headers: {'X-RapidAPI-Key': apiKey, 'X-RapidAPI-Host': host},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(
        response.body,
      ); //	jsonDecode يحوله إلى كائن Dart يمكن الوصول إلى الحقول بداخله
      final dataJson = jsonResponse['data'] as Map<String, dynamic>;
      final data = ProductModel.fromJson(dataJson);

      print(data.toString());
      return data;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
