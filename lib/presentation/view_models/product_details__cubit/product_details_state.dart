part of 'product_details_cubit.dart';

sealed class ProductsDetailsState {}

final class ProductsDetailsInitial extends ProductsDetailsState {}

final class ProductDetailsLoading extends ProductsDetailsState {}

final class ProductDetailsLoaded extends ProductsDetailsState {
  final ProductDetailsModel productDetailsModel;
  final int quantity;
  final double totalPrice;
  // final Color selectedColor;

  ProductDetailsLoaded({
    required this.productDetailsModel,
    required this.quantity,
    required this.totalPrice,
    // required this.selectedColor,
  });

  ProductDetailsLoaded copyWith({
    int? quantity,
    double? totalPrice,
    ProductDetailsModel? productModel,
    // Color? selectedColor,
  }) {
    return ProductDetailsLoaded(
      productDetailsModel: productModel ?? productDetailsModel,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      // selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

final class ProductDetailsError extends ProductsDetailsState {
  final String message;
  ProductDetailsError({required this.message});
}
