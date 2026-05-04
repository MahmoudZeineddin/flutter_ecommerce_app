import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_details_model.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/details_page/quantity_contor.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsSheet extends StatefulWidget {
  final ProductDetailsModel productDetails;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const ProductDetailsSheet({
    super.key,
    required this.productDetails,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<ProductDetailsSheet> createState() => _ProductDetailsSheetState();
}

class _ProductDetailsSheetState extends State<ProductDetailsSheet> {
  int selectedColorIndex = -1;

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productDetails.productTitle.split(' ').take(3).join(' '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.headingBigSize(context),
              ),
              if (widget.productDetails.productByline != null)
                Text(
                  widget.productDetails.productByline!,
                  style: AppTextStyles.subHeading(context),
                ),
              if (widget.productDetails.productStarRating != null)
                Row(
                  children: [
                    Icon(
                      RemixIcons.star_fill,
                      color: AppColors.starReating,
                      size: context.widthPct(.04),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.productDetails.productStarRating!.toStringAsFixed(
                        1,
                      ),
                      style: AppTextStyles.headingSmallSize(context),
                    ),
                    if (widget.productDetails.productNumRatings != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.productDetails.productNumRatings})',
                        style: AppTextStyles.subHeading(context),
                      ),
                    ],
                  ],
                ),
            ],
          ),
        ),
        Column(
          children: [
            QuantityCounter(
              quantity: widget.quantity,
              onDecrement: widget.onDecrement,
              onIncrement: widget.onIncrement,
            ),
            SizedBox(height: context.heightPct(.007)),
            Text(
              widget.productDetails.productAvailability ?? 'In Stock',
              style: AppTextStyles.body(context),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleRow(context),
          SizedBox(height: context.heightPct(.03)),
          _buildBadges(context),
          SizedBox(height: context.heightPct(.03)),
          _buildDescription(context),
          // _buildPriceRow(context),
          SizedBox(height: context.heightPct(.03)),
          _buildAboutProduct(context),
        ],
      ),
    );
  }

  Widget _badge(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 0.5),
      ),
      child: Text(label, style: AppTextStyles.body(context, color: color)),
    );
  }

  Widget _buildBadges(BuildContext context) {
    // Only render if at least one badge is true
    if (!widget.productDetails.isBestSeller && !widget.productDetails.isPrime) {
      return const SizedBox.shrink();
    }
    return Wrap(
      spacing: 8,
      children: [
        if (widget.productDetails.isBestSeller)
          _badge(context, 'Best Seller', AppColors.starReating),
        if (widget.productDetails.isPrime)
          _badge(context, 'Prime', AppColors.primaryColor),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    if (widget.productDetails.productDescription == null)
      return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppTextStyles.headingSmallSize(context)),
        SizedBox(height: context.heightPct(.01)),
        ReadMoreText(
          widget.productDetails.productDescription!,
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: ' Read less',
          colorClickableText: AppColors.primaryColor,
          style: AppTextStyles.body(context),
          moreStyle: AppTextStyles.body(context, color: AppColors.primaryColor),
          lessStyle: AppTextStyles.body(context, color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget _buildAboutProduct(BuildContext context) {
    if (widget.productDetails.aboutProduct.isEmpty)
      return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this product',
          style: AppTextStyles.headingSmallSize(context),
        ),
        SizedBox(height: context.heightPct(.01)),
        ...widget.productDetails.aboutProduct.map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                Expanded(
                  child: Text(point, style: AppTextStyles.body(context)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
