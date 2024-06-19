import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_tutorial/features/cart/ui/cart_tile_widget.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    BlocProvider.of<CartBloc>(context).add(CartSucessEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartInitial:
              return Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return successState.cartItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTileWidget(
                            // cartBloc: cartBloc,
                            productDataModel: successState.cartItems[index]);
                      })
                  : Center(child: Text("No cart items"));

            default:
          }
          return Container();
        },
      ),
    );
  }
}
