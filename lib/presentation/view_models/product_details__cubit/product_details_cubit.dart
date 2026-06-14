import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_details_model.dart';
import 'package:flutter_ecommerce_app/core/data/models/product_model.dart';
import 'package:flutter_ecommerce_app/core/domain/repositories/product_repository.dart';

part 'product_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  final ProductRepository _productRepository;
  ProductModel? selectedProduct;
  int quantity = 1;
  ProductsDetailsCubit(this._productRepository)
    : super(ProductsDetailsInitial());

  void getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    try {
      final details = await _productRepository.getProductDetails(asin: id);
      emit(
        ProductDetailsLoaded(
          productDetailsModel: details,
          quantity: quantity,
          totalPrice: details.productPrice * quantity,
        ),
      );
    } catch (e) {
      emit(ProductDetailsError(message: 'Failed to load product details'));
    }
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
