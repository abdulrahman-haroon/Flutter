import 'package:flutter/material.dart';
import 'package:ms_11_authentication/components/my_button.dart';
import 'package:ms_11_authentication/components/my_text_field.dart';
import 'package:ms_11_authentication/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              //welcome back
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(height: 25),

              //username textfield
              MyTextField(
                controller: userNameController,
                hintText: "Username",
                obsureText: false,
              ),
              const SizedBox(height: 10),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obsureText: true,
              ),
              //forgot password
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forget Password?"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              //sign in button
              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(height: 50),
              //or continue with
              //divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "or continue with",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // google || apple sign in button
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: "lib/images/google.png"),
                  SizedBox(width: 10),
                  SquareTile(imagePath: "lib/images/apple.png"),
                ],
              ),
              const SizedBox(height: 50),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a memember?",style: TextStyle(color:Colors.grey[700]),),
                  const SizedBox(width: 4),
                  const Text("Register now",style: TextStyle(color:Colors.blue))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
