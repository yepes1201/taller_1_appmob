import 'package:flutter/material.dart';
import 'package:taller_1_appmob/loginscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(child: LoginScreen()),
    );
  }
}
