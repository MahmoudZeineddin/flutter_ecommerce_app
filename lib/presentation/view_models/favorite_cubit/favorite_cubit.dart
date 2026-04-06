import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/core/domain/entities/product.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
}
