import 'package:flutter/material.dart';

import '../../home/models/home_product_data_model.dart';
import '../bloc/wishlist_bloc.dart';

class WishTile extends StatelessWidget {
  final ProductDataModel productDataModel;

  final WishlistBloc wishbloc;
  const WishTile(
      {super.key, required this.productDataModel, required this.wishbloc});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Text("hii"),
    //   ),
    // );
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(productDataModel.imageUrl),
      ),
      title: Text(productDataModel.name),
      subtitle: Text(productDataModel.description),
      trailing: Column(
        children: [
          Text("RS ${productDataModel.price}".toString()),
          InkWell(
            child: Icon(Icons.delete),
            onTap: () => wishbloc.add(WishListRemoveFromCartEvent(
                productDataModel: productDataModel)),
          )
        ],
      ),
    );
  }
}
