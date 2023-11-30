import 'package:ecommerce_app/screens/splash/components/body.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routename = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
