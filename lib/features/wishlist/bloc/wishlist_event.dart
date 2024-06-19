part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class WishListRemoveFromCartEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishListRemoveFromCartEvent({required this.productDataModel});

  // CartRemoveFromCartEvent({
  //   required this.productDataModel,
  // });
}

class WishListSucessEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishListSucessEvent({required this.productDataModel});

  // CartRemoveFromCartEvent({
  //   required this.productDataModel,
  // });
}
