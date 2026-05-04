import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_details_model.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';

part 'product_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductModel? selectedProduct;
  int quantity = 1;
  ProductsDetailsCubit() : super(ProductsDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        ProductDetailsLoaded(
          productDetailsModel: dummyProductDetails,
          quantity: quantity,
          totalPrice: dummyProductDetails.productPrice * quantity,
        ),
      );
    });
  }

  void updateQuantity(int newQuantity) {
    if (state is ProductDetailsLoaded && newQuantity >= 1 && newQuantity <= 6) {
      final currentState = state as ProductDetailsLoaded;
      quantity = newQuantity;

      emit(
        currentState.copyWith(
          quantity: newQuantity,
          totalPrice:
              currentState.productDetailsModel.productPrice * newQuantity,
        ),
      );
    }
  }
}
