import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model_new.dart';

import 'package:flutter_ecommerce_app/core/domain/repositories/product_repository.dart';
part 'home_state.dart';

// HomeCubit = Manager ==>  Make decisions, fetch data, control logic
class HomeCubit extends Cubit<HomeState> {
  final ProductRepository _productRepository;

  HomeCubit(this._productRepository) : super(HomeCubitInitial());
  // When creating HomeCubit, give me a ProductRepository
  // Before I start working, my status is 'Initial'
  // HomeInitial = The "before anything happens" state
  // void getHomeData() {
  //   emit(HomeLoading());
  //   Future.delayed(const Duration(seconds: 2), () {
  //     emit(
  //       HomeLoaded(
  //         carouselItems: dummyCarouselItems,
  //         products: dummyProducts,
  //         categories: getProcessedCategories(dummyProducts),
  //       ),
  //     );
  //   });
  // }

  Future<void> loadHomeData() async {
    if (state is HomeLoaded) return;
    emit(HomeLoading());
    try {
      final bestSellersFuture = _productRepository.getBestSellers(
        category: 'electronics',
      );
      final dealsFuture = _productRepository.getDeals(category: 'electronics');
      final trendingFuture = _productRepository.searchProducts(
        query: 'trending',
        page: 1,
      );
      final categoriesFuture = _productRepository.getCategories();

      final bestSellers = await bestSellersFuture;
      final deals = await dealsFuture;
      final trending = await trendingFuture;
      final categories = await categoriesFuture;

      emit(
        HomeLoaded(
          bestSellers: bestSellers,
          hotDeals: deals,
          trending: trending,
          // categories: categories,
        ),
      );

      // emit(
      //   HomeLoaded(
      //     bestSellers: dummyProducts,
      //     hotDeals: dummyProducts,
      //     trending: dummyProducts,
      //   ),
      // );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
