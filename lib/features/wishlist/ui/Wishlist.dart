import 'package:bloc_grocery_demo/data/cart_items.dart';
import 'package:bloc_grocery_demo/extensions.dart';
import 'package:bloc_grocery_demo/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});

  @override
  State<WishlistWidget> createState() => _CartState();
}

class _CartState extends State<WishlistWidget> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Items'),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    state.log();
                    cartItems.log();
                    return WishlistTileWidget(wishlistBloc: wishlistBloc, productDataModel: successState.wishlistItems[index]);
                  });
          }
          return Container();
        },
      ),
    );
  }
}
