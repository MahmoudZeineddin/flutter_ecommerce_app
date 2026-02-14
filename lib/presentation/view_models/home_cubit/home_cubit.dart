import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/entities/home_page/category_entity.dart';
import 'package:flutter_ecommerce_app/presentation/entities/home_page/home_carousel_entity.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';

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
