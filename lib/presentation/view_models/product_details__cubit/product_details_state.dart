part of 'product_details_cubit.dart';

sealed class ProductsDetailsState {}

final class ProductsDetailsInitial extends ProductsDetailsState {}

final class ProductDetailsLoading extends ProductsDetailsState {}

final class ProductDetailsLoaded extends ProductsDetailsState {
  final ProductItemModel productItemModel;
  final int quantity;
  final double totalPrice;
  final Color selectedColor;

  ProductDetailsLoaded({
    required this.productItemModel,
    required this.quantity,
    required this.totalPrice,
    required this.selectedColor,
  });

  ProductDetailsLoaded copyWith({
    int? quantity,
    double? totalPrice,
    ProductItemModel? productItemModel,
    Color? selectedColor,
  }) {
    return ProductDetailsLoaded(
      productItemModel: productItemModel ?? this.productItemModel,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

final class ProductDetailsError extends ProductsDetailsState {
  final String message;
  ProductDetailsError({required this.message});
}
