part of 'home_cubit.dart';

// HomeState = Current Situation =>> Tell UI what's happening RIGHT NOW
sealed class HomeState {}

final class HomeCubitInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductModel> bestSellers;
  final List<ProductModel> hotDeals;
  final List<ProductModel> trending;

  HomeLoaded({
    required this.bestSellers,
    required this.hotDeals,
    required this.trending,
  });
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
