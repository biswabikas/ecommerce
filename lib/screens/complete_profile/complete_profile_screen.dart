import 'package:ecommerce_app/screens/complete_profile/components/body.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routename = '/complete_profile';
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
