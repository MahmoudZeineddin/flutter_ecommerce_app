import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/presentation/entities/home_page/home_carousel_entity.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
      options: FlutterCarouselOptions(
        height: context.heightPct(.22),
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        showIndicator: true,
        viewportFraction: 0.92, // make imgae take all width
        floatingIndicator: false,
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: const SlideIndicatorOptions(
            indicatorRadius: 3.5,
            itemSpacing: 10.0,
            currentIndicatorColor: AppColors.primaryColor,
            indicatorBackgroundColor: AppColors.inactiveGrey,
          ),
        ),
      ),
      itemCount: dummyCarouselItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 3.0),
            child: CachedNetworkImage(
              imageUrl: dummyCarouselItems[itemIndex].imgUrl,
              width: double.infinity,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }
}
