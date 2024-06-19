import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/ui/wishlist_tile.dart';

class Wishlistssss extends StatefulWidget {
  const Wishlistssss({super.key});

  @override
  State<Wishlistssss> createState() => _WishlistssssState();
}

class _WishlistssssState extends State<Wishlistssss> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listener: (context, state) {},
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishListinitial:
                return Scaffold(
                    body: Center(
                  child: CircularProgressIndicator(),
                ));
              case WishListSuccessState:
                final wishlist = state as WishListSuccessState;
                return wishlist.wishItems.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (c, i) {
                          return WishTile(
                              productDataModel: wishlist.wishItems[i],
                              wishbloc: wishlistBloc);
                        },
                        separatorBuilder: (c, i) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: wishlist.wishItems.length)
                    : Center(
                        child: Text('No wishList Items'),
                      );

              default:
            }
            return SizedBox();
          }),
    );
  }
}
