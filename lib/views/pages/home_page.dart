import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/views/models/home_carousel_item_model.dart';
import 'package:flutter_ecommerce_app/views/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1000',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Hi Mahmoud',
                            style: context.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Let\'s go shopping',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Remix.search_line),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Remix.notification_4_line),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.heightPct(.04)),

              FlutterCarousel.builder(
                options: FlutterCarouselOptions(
                  height: context.heightPct(.20),
                  showIndicator: true,
                  viewportFraction: 1, // make imgae take all width
                  floatingIndicator: false,
                  slideIndicator: CircularSlideIndicator(
                    slideIndicatorOptions: const SlideIndicatorOptions(
                      indicatorRadius: 3.5,
                      itemSpacing: 12.0,
                      currentIndicatorColor: AppColors.primaryColor,
                      indicatorBackgroundColor: AppColors.inactiveGrey,
                    ),
                  ),
                ),
                itemCount: dummyCarouselItems.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 3.0),
                          child: Image.network(
                            dummyCarouselItems[itemIndex].imgUrl,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
              ),

              SizedBox(height: context.heightPct(.04)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' New Arrifals🔥',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    ' See All',
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.heightPct(.02)),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(productItemModel: dummyProducts[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
