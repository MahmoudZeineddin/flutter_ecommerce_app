import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/presentation/view_models/product_details__cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/details_page/quantity_contor.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsSheet extends StatefulWidget {
  final ProductItemModel product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const ProductDetailsSheet({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<ProductDetailsSheet> createState() => _ProductDetailsSheetState();
}

class _ProductDetailsSheetState extends State<ProductDetailsSheet> {
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
            context.read<ProductsDetailsCubit>().selectColor(color);
            // selectedColorIndex = (selectedColorIndex == index) ? -1 : index;
            //  add the color container logic and fix problem if the color was white how is shown in screen
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: context.heightPct(.40)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            widget.product.name,
                            style: AppTextStyles.headingBigSize(context),
                          ),
                          Row(
                            children: [
                              Icon(
                                RemixIcons.star_fill,
                                color: AppColors.starReating,
                                size: context.widthPct(.05),
                              ),
                              SizedBox(width: context.widthPct(.01)),
                              Text(
                                widget.product.rating.toString(),
                                style: AppTextStyles.headingSmallSize(context),
                              ),
                              SizedBox(width: context.widthPct(.01)),
                              Text(
                                '(${widget.product.numberOfReviews.toString()} Reviews)',
                                style: AppTextStyles.subHeading(context),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          QuantityCounter(
                            quantity: widget.quantity,
                            onDecrement: widget.onDecrement,
                            onIncrement: widget.onIncrement,
                          ),
                          SizedBox(height: context.heightPct(.007)),
                          Text(
                            'Avaliable in stock',
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
                        style: AppTextStyles.headingSmallSize(context),
                      ),
                      SizedBox(height: context.heightPct(.005)),
                      Row(
                        children: List.generate(
                          widget.product.availableColors.length,
                          (index) => _colorBox(
                            context,
                            widget.product.availableColors[index],
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
                        style: AppTextStyles.headingSmallSize(context),
                      ),
                      SizedBox(height: context.heightPct(.01)),
                      ReadMoreText(
                        widget.product.description,
                        trimLines: 4,
                        colorClickableText: AppColors.primaryColor,
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
    );
  }
}
