import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/screens/details/components/color_dot.dart';
import 'package:ecommerce_app/screens/details/components/product_description.dart';
import 'package:ecommerce_app/screens/details/components/product_images.dart';
import 'package:ecommerce_app/screens/details/components/top_rounded_container.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
              ),
              child: ProductDescription(
                product: product,
                pressonseemore: () {},
              ),
            ),
          ),
          TopRoundedContainer(
            color: const Color(0xFFF6F7F9),
            child: Column(
              children: [
                ColorDots(product: product),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth! * 0.15,
                      right: SizeConfig.screenWidth! * 0.15,
                      top: getProportionateScreenWidth(15),
                      bottom: getProportionateScreenWidth(40),
                    ),
                    child: DefaultButton(
                      text: 'Add to Cart',
                      press: () {},
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
