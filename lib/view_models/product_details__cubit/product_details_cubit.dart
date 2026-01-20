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
      emit(ProductDetailsLoaded(productItemModel: selectedProduct!));
    });
  }

  void updateQuantity(int newQuantity) {
    if (selectedProduct != null && newQuantity >= 1) {
      quantity = newQuantity;
      double totalPrice = selectedProduct!.price * quantity;
      emit(ProductPriceUpdated(quantity: quantity, totalPrice: totalPrice));
    }
  }

  double get currentTotalPrice => selectedProduct!.price * quantity;
}
