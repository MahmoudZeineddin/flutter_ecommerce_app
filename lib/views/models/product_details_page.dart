import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/view_models/product_details__cubit/product_details_cubit.dart';
import 'package:remixicon/remixicon.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

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
          final product = state.productItemModel;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product items'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(RemixIcons.shopping_cart_line),
                ),
              ],
            ),

            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: context.heightPct(.35),
                  decoration: const BoxDecoration(
                    color: AppColors.productItemBackground,
                  ),

                  child: CachedNetworkImage(imageUrl: product.imageUrl),
                ),
                // Positioned(
                //   width: context.widthPct(1),
                //   height: context.heightPct(.5),
                //   top: 70,
                //   // bottom: 30,

                //   // context.heightPct(.5)
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [
                //         Container(
                //           height: context.heightPct(.9),
                //           width: double.infinity,
                //           decoration: const BoxDecoration(
                //             color: AppColors.primaryColor,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        } else if (state is ProductDetailsError) {
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
