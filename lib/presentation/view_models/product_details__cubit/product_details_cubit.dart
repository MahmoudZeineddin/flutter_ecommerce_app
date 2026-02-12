import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';

part 'product_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductItemModel? selectedProduct;
  int quantity = 1;
  ProductsDetailsCubit() : super(ProductsDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2), () {
      selectedProduct = dummyProducts.firstWhere((product) => product.id == id);
      emit(
        ProductDetailsLoaded(
          productItemModel: selectedProduct!,
          quantity: quantity,
          totalPrice: selectedProduct!.price,
          selectedColor: selectedProduct!.availableColors.first,
        ),
      );
    });
  }

  void updateQuantity(int newQuantity) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;
      quantity = newQuantity;
      if (newQuantity >= 1) {
        emit(
          currentState.copyWith(
            quantity: newQuantity,
            totalPrice: currentState.productItemModel.price * newQuantity,
          ),
        );
      }
    }
  }

  void selectColor(Color color) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;
      emit(currentState.copyWith(selectedColor: color));
    }
  }
}
