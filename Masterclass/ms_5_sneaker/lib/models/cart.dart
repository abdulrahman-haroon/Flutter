import 'package:flutter/material.dart';
import 'package:ms_5_sneaker/models/shoe.dart';

class Cart extends ChangeNotifier{
  // list of shoes for sale

  List<Shoe> shoeShop=[
    Shoe(name: "Air Jordans", price: "236", imagePath: "lib/images/nike1.png", description: "The forward-thinking design of his latest signature shoe."),
    Shoe(name: "Zoom FREAK", price: "200", imagePath: "lib/images/nike2.png", description: "The forward-thinking design of his latest signature shoe."),
    Shoe(name: "Air Jordans C", price: "220", imagePath: "lib/images/nike1.png", description: "The forward-thinking design of his latest signature shoe."),
    Shoe(name: "Zoom FREAK C", price: "210", imagePath: "lib/images/nike2.png", description: "The forward-thinking design of his latest signature shoe.")
  ];

  // list of items in user cart
  List<Shoe> userCart=[];

  // get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  // get cart
 List<Shoe> getUserCard(){
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe){
      userCart.add(shoe);
      notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
      notifyListeners();
  }
}