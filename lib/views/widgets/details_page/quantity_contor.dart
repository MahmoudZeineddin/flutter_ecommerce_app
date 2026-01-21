import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';

class QuantityCounter extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityCounter({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  Widget _counterButton(
    BuildContext context,
    IconData icon,
    VoidCallback? onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: context.widthPct(.07),
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackground,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(onTap: onTap, child: Icon(icon)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: AppColors.productItemBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              _counterButton(
                context,
                RemixIcons.subtract_fill,
                quantity > 1 ? onDecrement : null,
              ),
              SizedBox(width: context.widthPct(.02)),
              Text(
                quantity.toString(),
                style: AppTextStyles.headingBigSize(
                  context,
                  fontWeigth: FontWeight.normal,
                ),
              ),

              SizedBox(width: context.widthPct(.02)),
              _counterButton(context, RemixIcons.add_line, onIncrement),
            ],
          ),
        ),
      ),
    );
  }
}
