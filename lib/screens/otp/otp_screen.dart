import 'package:ecommerce_app/screens/otp/components/body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  static String routename = '/otp';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otp Verification'),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
