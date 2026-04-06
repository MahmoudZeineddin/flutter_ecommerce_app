import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/constants/app_categories.dart';

import 'package:flutter_ecommerce_app/presentation/widgets/home_page/category/category_card.dart';

class CategorieySection extends StatelessWidget {
  final AppCategory mainCategory;

  const CategorieySection({super.key, required this.mainCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.heightPct(.02)),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            mainCategory.name,
            style: AppTextStyles.headingBigSize(
              context,
            ).copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mainCategory.subCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final subCat = mainCategory.subCategories[index];
            return CategoryCard(appCategory: subCat);
          },
        ),
      ],
    );
  }
}
