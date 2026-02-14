import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/presentation/entities/home_page/category_entity.dart'
    as CategoryModel;
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/category_card_tap_view.dart';

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
