import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/views/widgets/custom_button.dart';

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
      height: context.heightPct(0.12),
      padding: EdgeInsets.symmetric(
        horizontal: context.widthPct(0.05),
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        //
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.widthPct(.30),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.bigSize(context),
                      children: [
                        const TextSpan(
                          text: '\$ ',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        TextSpan(text: widget.price.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomButton(
            text: 'Add to Cart',
            onPressed: () => {},
            icon: RemixIcons.shopping_bag_4_line,
            width: context.widthPct(0.50),
          ),
        ],
      ),
    );
  }
}
