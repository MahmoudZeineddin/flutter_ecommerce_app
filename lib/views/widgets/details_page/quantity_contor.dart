import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:remixicon/remixicon.dart';

class QuantityContor extends StatefulWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityContor({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<QuantityContor> createState() => _QuantityContorState();
}

class _QuantityContorState extends State<QuantityContor> {
  Widget _counterButton(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
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
          child: InkWell(
            onTap: () {
              setState(() {
                onTap;
              });
            },
            child: Icon(icon),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthPct(.27),
      height: context.heightPct(.045),
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
            children: [
              _counterButton(
                context,
                RemixIcons.subtract_fill,
                () => widget.quantity > 1 ? widget.onDecrement : null,
              ),
              SizedBox(width: context.widthPct(.02)),
              Text(
                widget.quantity.toString(),
                style: AppTextStyles.headingBigSize(
                  context,
                  fontWeigth: FontWeight.normal,
                ),
              ),

              SizedBox(width: context.widthPct(.02)),
              _counterButton(
                context,
                RemixIcons.add_line,
                () => widget.onIncrement,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
