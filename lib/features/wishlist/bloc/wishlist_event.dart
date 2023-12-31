part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class ItemRemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  ItemRemoveFromWishlistEvent({required this.productDataModel});
}
