import 'package:flutter/material.dart';
import 'package:ms_8_ecommerce/models/product.dart';
import 'package:ms_8_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this item to your cart?"),
        actions: [
          //cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: const Icon(Icons.favorite)),
              ),
              const SizedBox(height: 25),
              //name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              //description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          //price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + product.price.toStringAsFixed(2)),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: const Icon(Icons.add)))
            ],
          ),
          //button to add to cart
        ],
      ),
    );
  }
}
