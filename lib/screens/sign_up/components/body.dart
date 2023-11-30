import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/components/social_card.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/screens/sign_up/components/signupform.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              const Text('Register Account', style: headingStyle),
              const Text(
                'Complete your details or continue \nwith social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              const SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  SocialCard(
                      icon: 'assets/icons/google-icon.svg', press: () {}),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  SocialCard(icon: 'assets/icons/twitter.svg', press: () {}),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(
                  20,
                ),
              ),
              const Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
