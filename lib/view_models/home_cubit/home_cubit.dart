import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/views/models/home_page/category_model.dart';
import 'package:flutter_ecommerce_app/views/models/home_page/home_carousel_item_model.dart';
import 'package:flutter_ecommerce_app/data/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitial());

  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        HomeLoaded(
          carouselItems: dummyCarouselItems,
          products: dummyProducts,
          categories: getProcessedCategories(dummyProducts),
        ),
      );
    });
  }
}
