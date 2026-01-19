import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/routers/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_page/product_item.dart';

class HomeTapBarView extends StatefulWidget {
  const HomeTapBarView({super.key});

  @override
  State<HomeTapBarView> createState() => _HomeTapBarViewState();
}

class _HomeTapBarViewState extends State<HomeTapBarView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                FlutterCarousel.builder(
                  options: FlutterCarouselOptions(
                    height: context.heightPct(.20),
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
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
                  itemCount: state.carouselItems.length,
                  //  dummyCarouselItems.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 3.0),
                            child: CachedNetworkImage(
                              imageUrl: state.carouselItems[itemIndex].imgUrl,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const CircularProgressIndicator.adaptive(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                      ' New Arrifals 🔥',
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
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(rootNavigator: true, context).pushNamed(
                          AppRoutes.productDetailsRoute,
                          arguments: state.products[index].id,
                        );
                      },
                      child: ProductItem(
                        productItemModel: state.products[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.message, style: context.textTheme.titleLarge),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
