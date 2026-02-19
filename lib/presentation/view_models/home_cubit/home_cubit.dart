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
    emit(HomeLoading());
    try {
      final results = await Future.wait([
        _productRepository.getBestSellers(category: 'electronics'),
        _productRepository.getDeals(category: 'electronics'),
        _productRepository.searchProducts(query: 'trending', page: 1),
      ]);
      emit(
        HomeLoaded(
          bestSellers: results[0],
          deals: results[1],
          trending: results[2],
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
