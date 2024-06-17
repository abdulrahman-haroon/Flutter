import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_11_authentication/pages/home_page.dart';
import 'package:ms_11_authentication/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //? user is login
          if (snapshot.hasData) {
            return HomePage();
          }
          //? user is not login?
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
