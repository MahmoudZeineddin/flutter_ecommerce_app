import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_details_model.dart';
import 'package:flutter_ecommerce_app/presentation/view_models/product_details__cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/details_page/product_details_sheet.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/details_page/product_purchase_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDetailsCubit, ProductsDetailsState>(
      bloc: BlocProvider.of<ProductsDetailsCubit>(context),
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is ProductDetailsLoaded) {
          final product = state.productDetailsModel;
          state.totalPrice;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(title: '', onPressed: () {}),
            bottomNavigationBar: ProductPurchaseBar(price: state.totalPrice),

            /*
Normal widget → "I am 300px tall, that's it"
Sliver        → "I am 300px tall, and I know the user 
                  has scrolled 120px so far"
*/
            body: CustomScrollView(
              // ← the scroll engine, owns all gestures
              slivers: [
                SliverToBoxAdapter(
                  // ← wraps a normal widget into a Sliver
                  child: _ProductImageSlider(
                    product: product,
                  ), // normal widget → becomes scroll-aware
                ),

                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBackground,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.heightPct(.03)),
                      child: ProductDetailsSheet(
                        // normal widget → becomes scroll-aware
                        productDetails: product,
                        quantity: state.quantity,
                        onDecrement: () {
                          context.read<ProductsDetailsCubit>().updateQuantity(
                            state.quantity - 1,
                          );
                        },
                        onIncrement: () {
                          context.read<ProductsDetailsCubit>().updateQuantity(
                            state.quantity + 1,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductDetailsError) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyles.headingBigSize(context),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _ProductImageSlider extends StatefulWidget {
  final ProductDetailsModel product;
  const _ProductImageSlider({required this.product});

  @override
  State<_ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<_ProductImageSlider> {
  int _currentIndex = 0;

  // Combine single photo + photos list, remove duplicates
  List<String> get _images {
    final all = <String>{};
    if (widget.product.productPhoto != null) {
      all.add(widget.product.productPhoto!);
    }
    all.addAll(widget.product.productPhotos);
    return all.toList();
  }

  @override
  Widget build(BuildContext context) {
    final images = _images;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: double.infinity,
        height: context.heightPct(.45),
        color: AppColors.productItemBackground,
        child: Stack(
          children: [
            // Images
            PageView.builder(
              itemCount: images.isEmpty ? 1 : images.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final url = images.isEmpty ? '' : images[index];
                return Padding(
                  padding: EdgeInsets.all(context.heightPct(.05)),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported),
                  ),
                );
              },
            ),

            // Dot indicators — only show if more than 1 image
            if (images.length > 1)
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _currentIndex == index ? 16 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? AppColors.primaryColor
                            : AppColors.inactiveGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
