import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartSucessEvent>(cartSucessEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartSucessEvent(
      CartSucessEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    await Future.delayed(Duration(milliseconds: 800));
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
// emit()
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    await Future.delayed(Duration(milliseconds: 800));
    // emit(CartSuccessState(cartItems: cartItems));
  }
}
