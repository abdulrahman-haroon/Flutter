import 'package:flutter/material.dart';
import 'package:ms_8_ecommerce/components/my_drawer.dart';
import 'package:ms_8_ecommerce/components/my_product_tile.dart';
import 'package:ms_8_ecommerce/models/product.dart';
import 'package:ms_8_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Shop Page",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(children: [
        const SizedBox(
          height: 25,
        ),
        const Center(
            child: Text("Pick from a selected list of premium products")),
        SizedBox(
          height: 550,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(25),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return MyProductTile(product: product);
            },
          ),
        ),
      ]),
    );
  }
}
