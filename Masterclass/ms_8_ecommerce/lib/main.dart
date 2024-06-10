import 'package:flutter/material.dart';
import 'package:ms_8_ecommerce/pages/intro_page.dart';
import 'package:ms_8_ecommerce/pages/shop_page.dart';
import 'package:ms_8_ecommerce/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage()
      },
    );
  }
}
