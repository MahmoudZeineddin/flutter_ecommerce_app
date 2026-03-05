import 'package:flutter_ecommerce_app/core/data/models/category_model.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model_new.dart';

// what data we need
/*
Domain Should NEVER Change! 🎯, else if change domain WILL be healthy!
But change it for:
✅ User needs
✅ Market demands
✅ Business evolution
*/
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
  Future<List<CategoryModel>> getCategories();
}
