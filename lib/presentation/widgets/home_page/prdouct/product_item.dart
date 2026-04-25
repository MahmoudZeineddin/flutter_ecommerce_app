import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_error.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_placeholder.dart';
import 'package:remixicon/remixicon.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  const ProductItem({super.key, required this.productModel});

  Widget _DiscountBadge(BuildContext context, int discountPercentage) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '-$discountPercentage%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthPct(.47),
      decoration: BoxDecoration(
        color: AppColors.productItemBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image Section ──
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productModel.productPhoto ?? '',
                    height: context.heightPct(.20),
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        ImagePlaceholder(height: context.heightPct(.18)),
                    errorWidget: (context, url, error) => const ImageError(),
                  ),
                ),
              ),

              // Discount Badge
              if (productModel.discountPercentage != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: _DiscountBadge(
                    context,
                    productModel.discountPercentage!.toInt(),
                  ),
                ),

              // Heart Button
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {}, // FavoriteCubit later
                    icon: const Icon(
                      Remix.heart_3_line,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ── Info Section ──
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  productModel.productTitle.split(' ').take(3).join(' '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // Brand
                Text(
                  productModel.isBestSeller ? '⭐ Best Seller' : 'Amazon',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Price Row
                Row(
                  children: [
                    Text(
                      '\$${productModel.productPrice.toStringAsFixed(2)}',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (productModel.productOriginalPrice != null)
                      Text(
                        '\$${productModel.productOriginalPrice!.toStringAsFixed(2)}',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: AppColors.secondaryText,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 6),

                // Rating + Cart Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Star Rating
                    if (productModel.productStarRating != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            productModel.productStarRating!.toStringAsFixed(1),
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      )
                    else
                      const SizedBox(),

                    // + Cart Button
                    GestureDetector(
                      onTap: () {}, // CartCubit later
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Remix.add_line,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/core/data/models/product_model_new.dart';
// import 'package:flutter_ecommerce_app/core/extensions/context_extensions.dart';
// import 'package:flutter_ecommerce_app/core/themes/colors.dart';
// import 'package:flutter_ecommerce_app/core/widgets/image_error.dart';
// import 'package:flutter_ecommerce_app/core/widgets/image_placeholder.dart';
// import 'package:remixicon/remixicon.dart';

// class ProductItem extends StatelessWidget {
//   final ProductModel productModel;

//   const ProductItem({super.key, required this.productModel});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: context.heightPct(.18),
//       width: context.widthPct(.40),
//       decoration: BoxDecoration(
//         color: AppColors.productItemBackground,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Image Section ──
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: CachedNetworkImage(
//                     imageUrl: productModel.productPhoto ?? "",
//                     height: context.heightPct(.20),
//                     fit: BoxFit.contain,
//                     placeholder: (context, url) => const ImagePlaceholder(),
//                     errorWidget: (context, url, error) => const ImageError(),
//                   ),
//                 ),
//               ),

//               // Discount Badge
//               if (productModel.discountPercentage != null)
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.discountBadgeBackground,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       '-${productModel.discountPercentage!.toInt()}%',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 11,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),

//               // Heart Button
//               Positioned(
//                 top: 7,
//                 right: 8,
//                 child: CircleAvatar(
//                   radius: 16,
//                   backgroundColor: AppColors.favoriteItemBackground,
//                   child: IconButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: () {},
//                     icon: const Icon(
//                       Remix.heart_3_line,
//                       color: AppColors.scaffoldBackground,
//                       size: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),


//           // ── Info Section ──
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Name
//                 Text(
//                   productModel.productTitle.split(' ').take(3).join(' '),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: context.textTheme.labelLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 4),

//                 // Brand
//                 Text(
//                   productModel.isBestSeller ? '⭐ Best Seller' : 'Amazon',
//                   style: context.textTheme.labelSmall?.copyWith(
//                     color: AppColors.secondaryText,
//                   ),
//                 ),

//                 const SizedBox(height: 6),

//                 // Price Row
//                 Row(
//                   children: [
//                     Text(
//                       '\$${productModel.productPrice.toStringAsFixed(2)}',
//                       style: context.textTheme.labelLarge?.copyWith(
//                         color: AppColors.primaryColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(width: 6),
//                     if (productModel.productOriginalPrice != null)
//                       Text(
//                         '\$${productModel.productOriginalPrice!.toStringAsFixed(2)}',
//                         style: context.textTheme.labelSmall?.copyWith(
//                           color: AppColors.secondaryText,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                   ],
//                 ),

//     //       SizedBox(height: context.heightPct(.012)),
//     //       Text(
//     //         maxLines: 1,
//     //         overflow: TextOverflow.ellipsis,
//     //         productModel.productTitle.split(" ").take(3).join(" "),
//     //         style: context.textTheme.labelLarge?.copyWith(
//     //           fontWeight: FontWeight.bold,
//     //         ),
//     //       ),

//     //       SizedBox(height: context.heightPct(.001)),
//     //     ],
//     //   ),
//     // );

//     //  Column(
//     //   crossAxisAlignment: CrossAxisAlignment.center,
//     //   children: [
//     //     Container(
//     //       height: context.heightPct(.18),
//     //       width: context.widthPct(.40),
//     //       // alignment: Alignment.center,
//     //       decoration: BoxDecoration(
//     //         borderRadius: BorderRadius.circular(16),
//     //         color: AppColors.productItemBackground,
//     //       ),

//     //       child: Stack(
//     //         alignment: Alignment.center,
//     //         children: [
//     //           Padding(
//     //             padding: const EdgeInsets.all(6.0),
//     //             child: ClipRRect(
//     //               borderRadius: BorderRadius.circular(16),
//     //               child: CachedNetworkImage(
//     //                 imageUrl: productModel.productPhoto ?? "",
//     //                 height: context.heightPct(.20),
//     //                 fit: BoxFit.contain,
//     //                 placeholder: (context, url) => const ImagePlaceholder(),
//     //                 errorWidget: (context, url, error) => const ImageError(),
//     //               ),
//     //             ),
//     //           ),
//     //           Positioned(
//     //             top: 8,
//     //             right: 8,
//     //             child: CircleAvatar(
//     //               radius: 16,
//     //               backgroundColor: AppColors.favoriteItemBackground,
//     //               child: IconButton(
//     //                 padding: EdgeInsets.zero,
//     //                 onPressed: () {},
//     //                 icon: const Icon(
//     //                   Remix.heart_3_line,
//     //                   color: AppColors.scaffoldBackground,
//     //                   size: 18,
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //     SizedBox(height: context.heightPct(.012)),
//     //     Text(
//     //       maxLines: 1,
//     //       overflow: TextOverflow.ellipsis,
//     //       productModel.productTitle.split(" ").take(3).join(" "),
//     //       style: context.textTheme.labelLarge?.copyWith(
//     //         fontWeight: FontWeight.bold,
//     //       ),
//     //     ),

//     //     SizedBox(height: context.heightPct(.001)),
//     //     Text(
//     //       maxLines: 1,
//     //       overflow: TextOverflow.ellipsis,
//     //       productModel.isBestSeller ? '⭐ Best Seller' : 'Amazon',
//     //       style: context.textTheme.labelSmall?.copyWith(
//     //         color: AppColors.secondaryText,
//     //       ),
//     //     ),

//     //     SizedBox(height: context.heightPct(.001)),

//     //     // product price
//     //     Text(
//     //       maxLines: 1,
//     //       overflow: TextOverflow.ellipsis,
//     //       "\$${productModel.productPrice.toStringAsFixed(2)}",
//     //       style: context.textTheme.labelLarge?.copyWith(
//     //         fontWeight: FontWeight.bold,
//     //       ),
//     //     ),
//     //   ],
//     // );
//   }
// }
