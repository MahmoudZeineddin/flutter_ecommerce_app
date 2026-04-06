import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/constants/app_categories.dart';

class CategoryCard extends StatelessWidget {
  final AppCategory appCategory;
  final BoxShape boxShape;
  const CategoryCard({
    super.key,
    required this.appCategory,
    this.boxShape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.widthPct(.2),
          height: context.heightPct(.10),
          decoration: BoxDecoration(
            color: AppColors.productItemBackground,
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                // CachedNetworkImage(
                //   height: context.heightPct(.06),
                //   fit: BoxFit.contain,
                //   imageUrl: appCategory.imageUrl,
                //   placeholder: (context, url) => ImagePlaceholder(
                //     width: double.infinity,
                //     height: context.heightPct(.22),
                //   ),
                //   errorWidget: (context, url, error) => const ImageError(),
                // ),
                IconButton(
                  icon: Icon(appCategory.icon, size: 30),
                  onPressed: () {
                    // appCategory.searchQuery;
                  },
                  color: AppColors.primaryColor,
                ),
          ),
        ),
        SizedBox(height: context.heightPct(.002)),
        Text(
          appCategory.name,
          style: AppTextStyles.body(
            context,
          ).copyWith(fontWeight: FontWeight.bold),

          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
