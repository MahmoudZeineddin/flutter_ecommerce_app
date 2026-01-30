import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/views/models/home_page/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryCard({super.key, required this.category, required this.index});

  Widget _buildInfo(BuildContext context, bool isEven) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: isEven
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Text(
              category.name,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.mainText,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${category.itemCount} Produsts',
              style: context.textTheme.labelLarge!.copyWith(
                color: AppColors.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Transform.scale(
          scale: 1.3,
          child: CachedNetworkImage(
            imageUrl: category.image,
            fit: BoxFit.contain,
            placeholder: (context, url) =>
                const CircularProgressIndicator.adaptive(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    return Container(
      height: context.heightPct(.13),
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.productItemBackground,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: isEven
            ? [_buildInfo(context, isEven), _buildImage()] // صورة يمين
            : [_buildImage(), _buildInfo(context, isEven)], // صورة يسار
      ),
    );
  }
}
