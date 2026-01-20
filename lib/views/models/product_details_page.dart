import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/view_models/product_details__cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/details_page/product_purchase_bar.dart';
import 'package:flutter_ecommerce_app/views/widgets/details_page/quantity_contor.dart';
import 'package:readmore/readmore.dart';
import 'package:remixicon/remixicon.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedColorIndex = -1;

  Widget _colorBox(BuildContext context, Color color, int index) {
    bool isClicked = selectedColorIndex == index;
    return Padding(
      padding: EdgeInsets.only(right: context.widthPct(.05)),
      child: Container(
        width: context.widthPct(.08),
        height: context.heightPct(.05),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedColorIndex = (selectedColorIndex == index) ? -1 : index;
            });
          },
          child: isClicked
              ? const Icon(
                  RemixIcons.check_fill,
                  color: AppColors.scaffoldBackground,
                )
              : null,
        ),
      ),
    );
  }

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
          final cubit = context.read<ProductsDetailsCubit>();
          int displayQuantity = cubit.quantity;
          final product = state.productItemModel;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product items'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(RemixIcons.shopping_bag_4_line),
                ),
              ],
            ),
            bottomNavigationBar: const ProductPurchaseBar(),

            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: context.heightPct(.35),
                  decoration: const BoxDecoration(
                    color: AppColors.productItemBackground,
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(context.heightPct(.05)),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: context.heightPct(.34)),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.scaffoldBackground,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: context.heightPct(.03),
                              left: context.heightPct(.03),
                              right: context.heightPct(.03),
                              bottom: context.heightPct(.02),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          product.name,
                                          style: AppTextStyles.headingBigSize(
                                            context,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              RemixIcons.star_fill,
                                              color: AppColors.starReating,
                                              size: context.widthPct(.05),
                                            ),
                                            SizedBox(
                                              width: context.widthPct(.01),
                                            ),
                                            Text(
                                              product.rating.toString(),
                                              style:
                                                  AppTextStyles.headingSmallSize(
                                                    context,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: context.widthPct(.01),
                                            ),
                                            Text(
                                              '(${product.numberOfReviews.toString()} Reviews)',
                                              style: AppTextStyles.subHeading(
                                                context,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        QuantityContor(
                                          quantity: cubit.quantity,
                                          onDecrement: () =>
                                              cubit.updateQuantity(
                                                displayQuantity - 1,
                                              ),
                                          onIncrement: () =>
                                              cubit.updateQuantity(
                                                displayQuantity + 1,
                                              ),
                                        ),
                                        SizedBox(
                                          height: context.heightPct(.007),
                                        ),
                                        Text(
                                          'Avaliable in stok',
                                          style: AppTextStyles.body(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.heightPct(.03)),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Colors",
                                      style: AppTextStyles.headingSmallSize(
                                        context,
                                      ),
                                    ),
                                    SizedBox(height: context.heightPct(.005)),
                                    Row(
                                      children: List.generate(
                                        product.availableColors.length,
                                        (index) => _colorBox(
                                          context,
                                          product.availableColors[index],
                                          index,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.heightPct(.03)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Description",
                                      style: AppTextStyles.headingSmallSize(
                                        context,
                                      ),
                                    ),
                                    SizedBox(height: context.heightPct(.01)),
                                    ReadMoreText(
                                      product.description,
                                      trimLines: 4,
                                      colorClickableText:
                                          AppColors.primaryColor,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Read more',
                                      trimExpandedText: ' Read less',
                                      moreStyle: AppTextStyles.body(
                                        context,
                                        color: AppColors.primaryColor,
                                      ),
                                      lessStyle: AppTextStyles.body(
                                        context,
                                        color: AppColors.primaryColor,
                                      ),
                                      style: AppTextStyles.body(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
