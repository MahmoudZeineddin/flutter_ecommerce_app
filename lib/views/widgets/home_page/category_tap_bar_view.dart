import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/home_page/category_model.dart'
    as CategoryModel;
import 'package:flutter_ecommerce_app/models/home_page/product_item_model.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_page/category_card.dart';

class CategoryTapBarView extends StatelessWidget {
  const CategoryTapBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final allCategories = CategoryModel.getProcessedCategories(dummyProducts);
    return ListView.builder(
      itemCount: allCategories.length,
      itemBuilder: (context, index) {
        final category = allCategories[index];
        return CategoryCard(category: category, index: index);
      },
    );
  }
}
