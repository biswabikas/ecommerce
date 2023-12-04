import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.text,
    required this.press,
    super.key,
  });
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.black),
          ),
          GestureDetector(
            onTap: press,
            child: const Text('See More'),
          )
        ],
      ),
    );
  }
}
