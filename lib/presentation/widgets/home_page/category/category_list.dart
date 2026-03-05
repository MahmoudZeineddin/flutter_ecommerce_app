import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/constants/app_categories.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/category/category_card.dart';

class CategoryList extends StatelessWidget {
  final List<AppCategory> categories;

  const CategoryList({super.key, this.categories = homeCategories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightPct(.14),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: context.widthPct(.02)),
        itemBuilder: (context, index) {
          return CategoryCard(appCategory: categories[index]);
        },
      ),
    );
  }
}
