import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_search_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [CustomSearchBar(enabled: true, onTap: () => {})],
            ),
          ),
        ),
      ),
    );
  }
}
