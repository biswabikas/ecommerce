import 'package:ecommerce_app/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routename = '/sign_up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign up'),
      ),
      body: const Body(),
    );
  }
}
