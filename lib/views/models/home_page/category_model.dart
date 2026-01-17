import 'package:flutter_ecommerce_app/views/models/home_page/product_item_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final int itemCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.itemCount,
  });
}

const Map<String, String> categoryImages = {
  'New Arrivals': 'https://pngimg.com/d/men_shoes_PNG7475.png',
  'Shoes': 'https://pngimg.com/d/running_shoes_PNG5823.png',
  'Tech': 'https://pngimg.com/d/iphone_14_PNG1.png',
  'Watches': 'https://pngimg.com/d/watches_PNG9854.png',
  'Laptops': 'https://pngimg.com/d/macbook_PNG65.png',
  'Clothes': 'https://pngimg.com/d/tshirt_PNG5450.png',
};

List<CategoryModel> getProcessedCategories(List<ProductItemModel> allProducts) {
  List<String> names = allProducts.map((p) => p.category).toSet().toList();
  List<CategoryModel> categoryList = names.map((catName) {
    return CategoryModel(
      id: DateTime.now().toString() + catName,
      name: catName,
      image: categoryImages[catName] ?? '',
      itemCount: allProducts.where((p) => p.category == catName).length,
    );
  }).toList();

  categoryList.insert(
    0,
    CategoryModel(
      id: 'new_arrivals_id',
      name: 'New Arrivals',
      image: categoryImages['New Arrivals']!,
      itemCount: allProducts.where((p) => p.isNewArrival).length,
    ),
  );

  return categoryList;
}
