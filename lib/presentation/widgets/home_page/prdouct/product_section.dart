import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model_new.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/prdouct/product_item.dart';
import 'package:flutter_ecommerce_app/core/widgets/title_section.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  final VoidCallback onSeeAll;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title: title, onSeeAll: onSeeAll),
        SizedBox(height: context.heightPct(.01)),

        SizedBox(
          height: context.heightPct(.35),

          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(productModel: product);
            },
            padding: EdgeInsets.only(left: 4, right: context.widthPct(.15)),
            separatorBuilder: (context, index) =>
                SizedBox(width: context.widthPct(.03)),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
