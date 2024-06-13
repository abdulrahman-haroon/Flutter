import 'package:flutter/material.dart';
import 'package:ms_8_ecommerce/components/my_button.dart';
import 'package:ms_8_ecommerce/components/my_drawer.dart';
import 'package:ms_8_ecommerce/models/product.dart';
import 'package:ms_8_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart?"),
        actions: [
          //cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("User want to pay! Connect to you backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart Page"),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text("\$" + item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => removeFromCart(context, item),
                          ),
                        );
                      },
                    )),
          //pay button
          if (cart.isEmpty == false)
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                  onTap: () => payButtonPressed(context),
                  child: Text("PAY NOW")),
            )
        ],
      ),
    );
  }
}
