import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/routers/app_routes.dart';
import 'package:flutter_ecommerce_app/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/category/category_card.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/home_carousel.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/prdouct/product_item.dart';

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
                // SizedBox(
                //   height: context.heightPct(.16),
                //   child: ListView.builder(
                //     physics: const BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: 2,
                //     // state.categories.length,
                //     itemBuilder: (context, index) {
                //       return CategoryCard(
                //         categoryModel: state.categories[index],
                //       );
                //     },
                //   ),
                // ),
                SizedBox(height: context.heightPct(.04)),

                SizedBox(height: context.heightPct(.02)),

                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: 2,
                //   // state.products.length,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 0.6,
                //     mainAxisSpacing: 10,
                //     crossAxisSpacing: 15,
                //   ),
                //   itemBuilder: (context, index) {
                //     return InkWell(
                //       onTap: () {
                //         Navigator.of(rootNavigator: true, context).pushNamed(
                //           AppRoutes.productDetailsRoute,
                //           arguments: 33,
                //           // state.products[index].id,
                //         );
                //       },
                //       child: ProductItem(
                //         productItemModel: state.trending,
                //         //  state.products[index],
                //       ),
                //     );
                //   },
                // ),
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
