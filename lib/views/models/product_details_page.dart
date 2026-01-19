import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/view_models/product_details__cubit/product_details_cubit.dart';
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
  int quantity = 1;
  Widget colorBox(BuildContext context, Color color, int index) {
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
            bottomNavigationBar: Container(
              height: context.heightPct(0.12),
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPct(0.05),
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                //
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.widthPct(.30),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: RichText(
                            text: TextSpan(
                              style: context.textTheme.displaySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainText,
                              ),
                              children: [
                                const TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: (product.price * quantity)
                                      .toStringAsFixed(2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.widthPct(0.50),
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            RemixIcons.shopping_bag_4_line,
                            color: AppColors.scaffoldBackground,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
                                          style: context.textTheme.titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
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
                                              style: context
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: context.widthPct(.01),
                                            ),
                                            Text(
                                              '(${product.numberOfReviews.toString()} Reviews)',
                                              style: context
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    color:
                                                        AppColors.secondaryText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Container(
                                          width: context.widthPct(.27),
                                          height: context.heightPct(.045),
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.productItemBackground,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          1.0,
                                                        ),
                                                    child: Container(
                                                      width: context.widthPct(
                                                        .07,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(
                                                            color: AppColors
                                                                .scaffoldBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              2.0,
                                                            ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              quantity > 1
                                                                  ? quantity--
                                                                  : null;
                                                            });
                                                          },
                                                          child: const Icon(
                                                            RemixIcons
                                                                .subtract_fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: context.widthPct(
                                                      .02,
                                                    ),
                                                  ),
                                                  Text(
                                                    quantity.toString(),
                                                    style: context
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .mainText,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    width: context.widthPct(
                                                      .02,
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          1.0,
                                                        ),
                                                    child: Container(
                                                      width: context.widthPct(
                                                        .07,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(
                                                            color: AppColors
                                                                .scaffoldBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              2.0,
                                                            ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              quantity++;
                                                            });
                                                          },
                                                          child: const Icon(
                                                            RemixIcons.add_line,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: context.heightPct(.007),
                                        ),
                                        Text(
                                          'Avaliable in stok',
                                          style: context.textTheme.labelMedium!
                                              .copyWith(
                                                color: AppColors.mainText,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                      style: context.textTheme.titleMedium!
                                          .copyWith(
                                            color: AppColors.mainText,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: context.heightPct(.005)),
                                    Row(
                                      children: List.generate(
                                        product.availableColors.length,
                                        (index) => colorBox(
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
                                      style: context.textTheme.titleMedium!
                                          .copyWith(
                                            color: AppColors.mainText,
                                            fontWeight: FontWeight.bold,
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
                                      moreStyle: context.textTheme.titleSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                          ),
                                      lessStyle: context.textTheme.titleSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                          ),
                                      style: context.textTheme.titleMedium!
                                          .copyWith(color: AppColors.mainText),
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
            child: Text(state.message, style: context.textTheme.titleLarge),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
