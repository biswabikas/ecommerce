import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth! * 0.6,
            // height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kSecondaryColor.withOpacity(0.1),
            ),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search Product',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(9),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          IconBtnWithCounter(
            svgsrc: 'assets/icons/Cart Icon.svg',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
          ),
          IconBtnWithCounter(
            svgsrc: 'assets/icons/Bell.svg',
            numberofitems: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
