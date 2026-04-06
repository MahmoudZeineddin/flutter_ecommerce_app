import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_categories.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_search_bar.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/categories_page/categoriey_section.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomSearchBar(enabled: true, onTap: () => {}),
              Expanded(
                child: ListView.builder(
                  itemCount: appCategoriesForCatePage.length,
                  itemBuilder: (context, index) {
                    return CategorieySection(
                      mainCategory: appCategoriesForCatePage[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
