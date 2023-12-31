import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight! * 0.4,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.08,
        ),
        Text(
          'Login Success',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: 'Back to Home',
            press: () {
              Navigator.pushNamed(context, HomeScreen.routename);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
