import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/di/injection_container.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_search_bar.dart';
import 'package:flutter_ecommerce_app/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/category/category_list.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/home_carousel.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/home_page/prdouct/product_section.dart';

/*
👆 User opens app
    │
    ▼
🚀 main.dart
    │  initializes DI (injection_container)
    │  registers: AmazonApiClient, ProductRepository, HomeCubit
    ▼
📱 MaterialApp
    │
    ▼
🏠 HomePage
    │  BlocProvider creates HomeCubit
    │  ..loadHomeData() triggers immediately
    ▼
📦 HomeCubit
    │  emit(HomeLoading) → shows spinner
    │  calls ProductRepository
    ▼
🏪 ProductRepository
    │  calls AmazonApiClient
    ▼
🌐 Amazon API
    │  returns JSON
    ▼
📦 HomeCubit
    │  emit(HomeLoaded) → shows products
    ▼
🏠 HomePage rebuilds
    │  shows ProductSection, CategoryList...
    ▼
👀 User sees products ✅
*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => sl<HomeCubit>(),
      // حل مشكلة استدعاء loadHomeData في كل مرة بعمل بسبب hot reload
      create: (context) => sl<HomeCubit>()..loadHomeData(),
      // Cascade operator = Call method AND return original object
      // creates HomeCubit
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }

          if (state is HomeLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomSearchBar(enabled: true),
                      SizedBox(height: context.heightPct(.02)),
                      const HomeCarousel(),
                      SizedBox(height: context.heightPct(.02)),
                      const CategoryList(),

                      ProductSection(
                        title: " Best Sellers ",
                        products: state.bestSellers,
                        onSeeAll: () {},
                      ),
                      SizedBox(height: context.heightPct(.02)),

                      ProductSection(
                        title: " Trending 🔥",
                        products: state.trending,
                        onSeeAll: () {},
                      ),
                      SizedBox(height: context.heightPct(.02)),

                      ProductSection(
                        title: " Hot Deals 🔥",
                        products: [],
                        // state.hotDeals,
                        onSeeAll: () {},
                      ),
                      SizedBox(height: context.heightPct(.02)),

                      // Popular Collections
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
