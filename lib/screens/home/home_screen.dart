import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/home/components/body.dart';
import 'package:ecommerce_app/screens/profile/components/custom-bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routename = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedmenu: Menustate.home),
    );
  }
}
