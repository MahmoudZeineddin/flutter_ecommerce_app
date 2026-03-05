import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final bool enabled;
  const CustomSearchBar({super.key, this.onTap, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: context.heightPct(.05),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.productItemBackground,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: AppColors.secondaryText,
                  size: 24,
                ),
                SizedBox(width: context.widthPct(.02)),
                Expanded(
                  child: TextField(
                    enabled: enabled,
                    decoration: const InputDecoration(
                      hintText: 'Search for products...',
                      hintStyle: TextStyle(color: AppColors.secondaryText),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.mainText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        IconButton(
          onPressed: () => {},
          icon: Icon(
            Remix.heart_line,
            size: 28,
            color: enabled ? AppColors.primaryColor : AppColors.inactiveGrey,
          ),
        ),
      ],
    );
  }
}
