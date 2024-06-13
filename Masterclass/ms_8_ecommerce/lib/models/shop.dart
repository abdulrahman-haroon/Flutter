import 'package:flutter/material.dart';
import 'package:ms_8_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(name: "Product 1", price: 99.9, description: "Item Description"),
    Product(name: "Product 2", price: 99.9, description: "Item Description"),
    Product(name: "Product 3", price: 99.9, description: "Item Description"),
    Product(name: "Product 4", price: 99.9, description: "Item Description"),
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
