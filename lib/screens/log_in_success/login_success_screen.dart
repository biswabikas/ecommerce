import 'package:ecommerce_app/screens/log_in_success/componenets/body.dart';
import 'package:flutter/material.dart';

class LogInSuccessScreen extends StatelessWidget {
  static String routename = '/login_success';
  const LogInSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Success'),
      ),
      body: const Body(),
    );
  }
}
