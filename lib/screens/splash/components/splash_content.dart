import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    this.text,
    this.image,
  });
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'TOKOTO',
          style: TextStyle(
              fontSize: getProportionateScreenHeight(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
