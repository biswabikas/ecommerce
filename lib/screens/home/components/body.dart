import 'categories.dart';
import 'package:ecommerce_app/screens/home/components/discount_banner.dart';
import 'package:ecommerce_app/screens/home/components/home_header.dart';
import 'package:ecommerce_app/screens/home/components/popular_product.dart';
import 'package:ecommerce_app/screens/home/components/special_offer.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const HomeHeader(),
            const DiscountBanner(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Categories(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const SpecialOffer(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const PopularProduct(),
          ],
        ),
      ),
    );
  }
}
