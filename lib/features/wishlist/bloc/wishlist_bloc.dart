import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishListinitial()) {
    on<WishListInitialEvent>(wishlistinitialevent);
    on<WishListRemoveFromCartEvent>(wishListRemoveFromCartEvent);
  }

  FutureOr<void> wishlistinitialevent(
      WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(wishItems: wishlistItems));
  }

  FutureOr<void> wishListRemoveFromCartEvent(
      WishListRemoveFromCartEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishListSuccessState(wishItems: wishlistItems));
  }
}
