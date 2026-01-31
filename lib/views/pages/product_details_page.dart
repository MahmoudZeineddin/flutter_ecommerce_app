import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/view_models/product_details__cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/custom_app_bar.dart';
import 'package:flutter_ecommerce_app/views/widgets/details_page/product_details_sheet.dart';
import 'package:flutter_ecommerce_app/views/widgets/details_page/product_purchase_bar.dart';

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
          final product = state.productItemModel;
          state.totalPrice;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(title: 'Product item', onPressed: () {}),
            bottomNavigationBar: ProductPurchaseBar(price: state.totalPrice),

            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: context.heightPct(.50),
                  decoration: const BoxDecoration(
                    color: AppColors.productItemBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.heightPct(.04),
                      vertical: context.widthPct(.25),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                ProductDetailsSheet(
                  product: product,
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
