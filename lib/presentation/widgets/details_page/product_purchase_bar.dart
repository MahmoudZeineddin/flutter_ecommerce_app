import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class ProductPurchaseBar extends StatefulWidget {
  final double price;

  const ProductPurchaseBar({super.key, required this.price});

  @override
  State<ProductPurchaseBar> createState() => _ProductPurchaseBarState();
}

class _ProductPurchaseBarState extends State<ProductPurchaseBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPct(0.10),
      padding: EdgeInsets.symmetric(
        horizontal: context.widthPct(0.06),
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
              Text(
                '\$ ${widget.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: AppTextStyles.headingBigSize(context).fontSize,
                  fontWeight: AppTextStyles.headingBigSize(context).fontWeight,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),

          CustomButton(
            text: 'Add to Cart',
            onPressed: () => {},
            icon: RemixIcons.shopping_bag_4_line,
            width: context.widthPct(.50),
          ),
        ],
      ),
    );
  }
}
