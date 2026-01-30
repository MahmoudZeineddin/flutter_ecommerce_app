import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/views/models/home_page/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Container(
        height: context.heightPct(.10),
        width: context.widthPct(.18),
        decoration: BoxDecoration(
          color: AppColors.productItemBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
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

            Expanded(
              // flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    categoryModel.name,
                    style: AppTextStyles.headingSmallSize(
                      context,
                    ).copyWith(fontSize: 11),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
