import 'package:flutter/material.dart';
import 'package:ms_5_sneaker/components/cart_item.dart';
import 'package:ms_5_sneaker/models/cart.dart';
import 'package:ms_5_sneaker/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>   Padding(
      padding: EdgeInsets.symmetric(horizontal:25 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
           "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          )),
        const SizedBox(height: 10),
        Expanded(
            child:ListView.builder(
              itemCount: value.getUserCard().length,
              itemBuilder: (context, index) {
              //get each shoe
              Shoe shoe=value.getUserCard()[index];
              //return the cart item
              return CartItem(shoe:shoe);
            })
          )
        ],
      ),
      ));
  }
}
