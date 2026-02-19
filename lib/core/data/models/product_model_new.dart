class ProductModel {
  final String asin;
  final String productTitle;
  final String? productPhoto;
  final double productPrice;
  final double? productOriginalPrice;
  final double? productStarRating;
  final int? productNumRatings;
  final String? currency;
  final bool isPrime;
  final bool isBestSeller;
  final String? salesVolume;

  ProductModel({
    required this.asin,
    required this.productTitle,
    this.productPhoto,
    required this.productPrice,
    this.productOriginalPrice,
    this.productStarRating,
    this.productNumRatings,
    this.currency,
    this.isPrime = false,
    this.isBestSeller = false,
    this.salesVolume,
  });

  // Computed discount
  double? get discountPercentage {
    if (productOriginalPrice == null || productOriginalPrice! <= productPrice) {
      return null;
    }
    return ((productOriginalPrice! - productPrice) / productOriginalPrice!) *
        100;
  }

  // Convert API Response to Object
  //Think of it like a Factory Machine:
  // JSON goes in → Factory processes it → ProductModel comes out
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      asin: json['asin'] ?? '',
      productTitle: json['product_title'] ?? 'No title',
      productPhoto: json['product_photo'],
      productPrice: _parsePrice(json['product_price']),
      productOriginalPrice: _parsePrice(json['product_original_price']),
      productStarRating: _parseDouble(json['product_star_rating']),
      productNumRatings: json['product_num_ratings'],
      currency: json['currency'],
      isPrime: json['is_prime'] ?? false,
      isBestSeller: json['is_best_seller'] ?? false,
      salesVolume: json['sales_volume'],
    );
  }
  // Handle Different Price Formats
  static double _parsePrice(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) {
      final cleaned = value.replaceAll(RegExp(r'[^\d.]'), '');
      return double.tryParse(cleaned) ?? 0.0;
    }
    return 0.0;
  }

  // Safe Number Conversion
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
