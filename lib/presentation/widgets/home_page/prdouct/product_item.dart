import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model_new.dart';
import 'package:flutter_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_error.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_placeholder.dart';
import 'package:remixicon/remixicon.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: context.heightPct(.18),
          width: context.widthPct(.40),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.productItemBackground,
          ),

          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: productModel.productPhoto ?? "",
                    height: context.heightPct(.20),
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const ImagePlaceholder(),
                    errorWidget: (context, url, error) => const ImageError(),
                  ),
                ),
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
          productModel.productTitle.split(" ").take(3).join(" "),
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: context.heightPct(.001)),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          productModel.isBestSeller ? '⭐ Best Seller' : 'Amazon',
          style: context.textTheme.labelSmall?.copyWith(
            color: AppColors.secondaryText,
          ),
        ),

        SizedBox(height: context.heightPct(.001)),

        // product price
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          "\$${productModel.productPrice.toStringAsFixed(2)}",
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
