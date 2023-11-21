part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel wishlistItemsModel;

  HomeProductWishlistButtonClickedEvent({required this.wishlistItemsModel});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel cartItemsModel;

  HomeProductCartButtonClickedEvent({required this.cartItemsModel});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
