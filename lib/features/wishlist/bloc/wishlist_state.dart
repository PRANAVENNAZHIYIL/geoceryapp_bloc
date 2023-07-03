part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishListinitial extends WishlistState {}

class WishListSuccessState extends WishlistState {
  final List<ProductDataModel> wishItems;
  WishListSuccessState({
    required this.wishItems,
  });
}
