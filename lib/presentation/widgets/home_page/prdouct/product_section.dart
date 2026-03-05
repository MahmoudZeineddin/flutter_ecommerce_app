import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model_new.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/prdouct/product_item.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  final VoidCallback onSeeAll;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See All',
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Remix.arrow_right_s_line,
                      color: AppColors.primaryColor,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: context.heightPct(.01)),
        SizedBox(
          height: context.heightPct(.35),

          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(productModel: product);
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: context.widthPct(.04)),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
