import 'package:bloc_grocery_demo/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(productDataModel.id),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productDataModel.name),
              Text(productDataModel.description),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(productDataModel.imageUrl, scale: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductWishlistButtonClickedEvent(
                          wishlistItemsModel: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductCartButtonClickedEvent(
                          cartItemsModel: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
