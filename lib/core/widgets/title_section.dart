import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  const TitleSection({super.key, required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
    );
  }
}
