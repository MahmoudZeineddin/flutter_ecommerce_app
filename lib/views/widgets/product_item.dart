import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/views/models/product_item_model.dart';
import 'package:remixicon/remixicon.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItemModel;

  const ProductItem({super.key, required this.productItemModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: context.heightPct(.22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.productItemBackground,
          ),

          child: Stack(
            children: [
              Image.network(
                productItemModel.imageUrl,
                height: context.heightPct(.30),
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 16,

                  backgroundColor: AppColors.favoriteItemBackground,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Remix.heart_3_line,
                      color: AppColors.scaffoldBackground,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.heightPct(.012)),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          productItemModel.name,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: context.heightPct(.001)),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          productItemModel.brand,
          style: context.textTheme.labelSmall?.copyWith(
            color: AppColors.secondaryText,
          ),
        ),

        SizedBox(height: context.heightPct(.001)),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          "\$${productItemModel.price.toStringAsFixed(2)}",
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
