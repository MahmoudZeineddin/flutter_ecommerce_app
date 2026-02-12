import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/presentation/entities/home_page/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 30,
              bottom: 5,
            ),
            child: Container(
              width: context.widthPct(.20),
              decoration: BoxDecoration(
                color: AppColors.productItemBackground,
                borderRadius: BorderRadius.circular(15),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: categoryModel.image,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator.adaptive(strokeWidth: 2),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.category_outlined),
                ),
              ),
            ),
          ),
        ),
        Text(
          categoryModel.name,
          style: AppTextStyles.headingSmallSize(context).copyWith(fontSize: 11),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
