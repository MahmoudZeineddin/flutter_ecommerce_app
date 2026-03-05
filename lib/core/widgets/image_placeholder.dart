import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagePlaceholder extends StatelessWidget {
  final double? width;
  final double? height;

  const ImagePlaceholder({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(width: width, height: height),
    );
  }
}
