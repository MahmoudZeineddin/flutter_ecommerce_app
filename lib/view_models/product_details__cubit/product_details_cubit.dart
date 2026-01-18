import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';

part 'product_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductsDetailsCubit() : super(ProductsDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2), () {
      final selectedProduct = dummyProducts.firstWhere(
        (product) => product.id == id,
      );
      emit(ProductDetailsLoaded(productItemModel: selectedProduct));
    });
  }
}
