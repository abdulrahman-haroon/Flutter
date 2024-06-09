import 'package:flutter/material.dart';
import 'package:ms_5_sneaker/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                'lib/images/logo.jpg',
                height: 240,
                color: Colors.grey[300],
                colorBlendMode: BlendMode.multiply,
              ),
            ),
            const SizedBox(height: 48),
            //title
            const Text(
              "Just Do It",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 24),
            //subtitle
            const Text(
              "Brand new sneakers and custom kicks made with premium quality",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            //start now button
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  )),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(25),
                child: const Center(
                  child: Text(
                    "Shop Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
