part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeCubitInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<HomeCarouselItemModel> carouselItems;
  final List<ProductItemModel> products;
  final List<CategoryModel> categories;

  HomeLoaded({
    required this.carouselItems,
    required this.products,
    required this.categories,
  });
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
