import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.icon,
    required this.press,
  });
  final String icon;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(12),
        ),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F6F9),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
