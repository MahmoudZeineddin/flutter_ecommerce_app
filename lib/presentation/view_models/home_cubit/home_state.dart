part of 'home_cubit.dart';

// HomeState = Current Situation =>> Tell UI what's happening RIGHT NOW
sealed class HomeState {}

final class HomeCubitInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductModel> bestSellers;
  final List<ProductModel> deals;
  final List<ProductModel> trending;

  HomeLoaded({
    required this.bestSellers,
    required this.deals,
    required this.trending,
  });
  // final List<HomeCarouselItemModel> carouselItems;
  // final List<ProductItemModel> products;
  // final List<CategoryModel> categories;

  // HomeLoaded({
  //   required this.carouselItems,
  //   required this.products,
  //   required this.categories,
  // });
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
