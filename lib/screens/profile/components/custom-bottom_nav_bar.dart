import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedmenu,
  });
  final Menustate selectedmenu;

  @override
  Widget build(BuildContext context) {
    const Color inactiveiconcolor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routename);
              },
              icon: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                // ignore: deprecated_member_use
                color: Menustate.home == selectedmenu
                    ? kPrimaryColor
                    : inactiveiconcolor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/Heart Icon.svg',
                color: Menustate.favourite == selectedmenu
                    ? kPrimaryColor
                    : inactiveiconcolor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/Chat bubble Icon.svg',
              ),
              color: Menustate.message == selectedmenu
                  ? kPrimaryColor
                  : inactiveiconcolor,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routename);
              },
              icon: SvgPicture.asset(
                'assets/icons/User Icon.svg',
                color: Menustate.profile == selectedmenu
                    ? kPrimaryColor
                    : inactiveiconcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
