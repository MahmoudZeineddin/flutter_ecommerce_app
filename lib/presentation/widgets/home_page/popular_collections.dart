import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/constants/app_categories.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_error.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_placeholder.dart';
import 'package:flutter_ecommerce_app/core/widgets/title_section.dart';

class PopularCollections extends StatelessWidget {
  const PopularCollections({super.key});

  Widget popularCollectionCard(BuildContext context, AppCategory collection) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),

        child: Stack(
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              imageUrl: collection.imageUrl ?? '',
              placeholder: (context, url) => ImagePlaceholder(
                width: double.infinity,
                height: context.heightPct(.22),
              ),
              errorWidget: (context, url, error) => const ImageError(),
            ),

            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6), // ← dark at bottom
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                collection.name,
                style: AppTextStyles.body(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.scaffoldBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSection(title: 'Popular Collections', onSeeAll: () {}),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 5,
            childAspectRatio: 1.5,
          ),
          children: popularCollections
              .map((collection) => popularCollectionCard(context, collection))
              .toList(),
        ),
      ],
    );
  }
}
