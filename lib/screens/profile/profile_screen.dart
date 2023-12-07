import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/profile/components/body.dart';
import 'package:ecommerce_app/screens/profile/components/custom-bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routename = './profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedmenu: Menustate.profile,
      ),
    );
  }
}
