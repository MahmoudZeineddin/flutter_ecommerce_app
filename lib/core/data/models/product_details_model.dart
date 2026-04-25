class ProductDetailsModel {
  final String asin;
  final String productTitle;
  final String? productPhoto;
  final List<String> productPhotos;
  final double productPrice;
  final double? productOriginalPrice;
  final double? productStarRating;
  final int? productNumRatings;
  final List<String> aboutProduct;
  final String? productDescription;
  final String? productAvailability;
  final String? productByline;
  final bool isBestSeller;
  final bool isPrime;

  // Computed discount percentage
  double? get discountPercentage {
    if (productOriginalPrice == null || productOriginalPrice! <= productPrice) {
      return null;
    }
    return ((productOriginalPrice! - productPrice) / productOriginalPrice!) *
        100;
  }

  ProductDetailsModel({
    required this.asin,
    required this.productTitle,
    this.productPhoto,
    this.productPhotos = const [],
    required this.productPrice,
    this.productOriginalPrice,
    this.productStarRating,
    this.productNumRatings,
    this.aboutProduct = const [],
    this.productDescription,
    this.productAvailability,
    this.productByline,
    this.isBestSeller = false,
    this.isPrime = false,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      asin: json['asin'] ?? '',
      productTitle: json['product_title'] ?? 'No title',
      productPhoto: json['product_photo'],
      productPhotos: List<String>.from(json['product_photos'] ?? []),
      productPrice: _parsePrice(json['product_price']),
      productOriginalPrice: _parsePrice(json['product_original_price']),
      productStarRating: _parseDouble(json['product_star_rating']),
      productNumRatings: json['product_num_ratings'],
      aboutProduct: List<String>.from(json['about_product'] ?? []),
      productDescription: json['product_description'],
      productAvailability: json['product_availability'],
      productByline: json['product_byline'],
      isBestSeller: json['is_best_seller'] ?? false,
      isPrime: json['is_prime'] ?? false,
    );
  }

  static double _parsePrice(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) {
      final cleaned = value.replaceAll(RegExp(r'[^\d.]'), '');
      return double.tryParse(cleaned) ?? 0.0;
    }
    return 0.0;
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}

final dummyProductDetails = ProductDetailsModel(
  asin: "B08N5LNQCX",
  productTitle: "Apple MacBook Air (13-inch, M1, 2020) - 8GB RAM, 256GB SSD",
  productByline: "Apple",
  productPrice: 899.99,
  productOriginalPrice: 999.00,
  productStarRating: 4.8,
  productNumRatings: 25430,
  productAvailability: "In Stock",
  isBestSeller: true,
  isPrime: true,
  productPhoto: "https://example.com/macbook_main.jpg",
  productPhotos: [
    "https://example.com/macbook_main.jpg",
    "https://example.com/macbook_side.jpg",
    "https://example.com/macbook_keyboard.jpg",
  ],
  aboutProduct: [
    "Apple-designed M1 chip for a giant leap in CPU, GPU, and machine learning performance",
    "Go longer than ever with up to 18 hours of battery life",
    "8-core CPU delivers up to 3.5x faster performance to tackle projects faster than ever",
    "8GB of unified memory makes your entire system speedy and responsive",
  ],
  productDescription:
      "The Apple MacBook Air with M1 chip is incredibly thin and light, with a silent fanless design and a beautiful Retina display. It's built to handle everything from professional-quality editing to action-packed gaming with ease.",
);
