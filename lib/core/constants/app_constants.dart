import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  // App name
  static const String appName = 'Flutter E-commerce App';

  // API key
  static String get apiKey => dotenv.env['RAPIDAPI_KEY'] ?? '';
  static String get host => dotenv.env['RAPIDAPI_HOST'] ?? '';

  // Real-Time Amazon Data API-endpoints
  static const String searchEndpoint = '/search';
  static const String detailsEndpoint = '/product-details';
  static const String offersEndpoint = '/product-offers';
  static const String reviewsEndpoint = '/product-reviews';
  static const String bestSellersEndpoint = '/best-sellers';
  static const String dealsEndpoint = '/deals-v2';
  static const String categoriesEndpoint = '/product-category-list';
}
