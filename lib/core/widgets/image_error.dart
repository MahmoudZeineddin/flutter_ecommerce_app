import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.productItemBackground,
      child: const Icon(Remix.image_2_line, color: AppColors.inactiveGrey),
    );
  }
}
