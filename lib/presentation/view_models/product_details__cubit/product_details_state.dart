part of 'product_details_cubit.dart';

sealed class ProductsDetailsState {}

final class ProductsDetailsInitial extends ProductsDetailsState {}

final class ProductDetailsLoading extends ProductsDetailsState {}

final class ProductDetailsLoaded extends ProductsDetailsState {
  final ProductDetailsModel productDetailsModel;
  final int quantity;
  final double totalPrice;

  ProductDetailsLoaded({
    required this.productDetailsModel,
    required this.quantity,
    required this.totalPrice,
  });

  ProductDetailsLoaded copyWith({
    int? quantity,
    double? totalPrice,
    ProductDetailsModel? productDetailsModel,
  }) {
    return ProductDetailsLoaded(
      productDetailsModel: productDetailsModel ?? this.productDetailsModel,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

final class ProductDetailsError extends ProductsDetailsState {
  final String message;
  ProductDetailsError({required this.message});
}
