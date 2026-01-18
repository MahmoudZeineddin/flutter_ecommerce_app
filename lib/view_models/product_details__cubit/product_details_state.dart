part of 'product_details_cubit.dart';

sealed class ProductsDetailsState {}

final class ProductsDetailsInitial extends ProductsDetailsState {}

final class ProductDetailsLoading extends ProductsDetailsState {}

final class ProductDetailsLoaded extends ProductsDetailsState {
  final ProductItemModel productItemModel;

  ProductDetailsLoaded({required this.productItemModel});
}

final class ProductDetailsError extends ProductsDetailsState {
  final String message;

  ProductDetailsError({required this.message});
}
