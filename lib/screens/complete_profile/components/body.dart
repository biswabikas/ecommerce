import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/complete_profile/components/complete_profile_form.dart';
import 'package:ecommerce_app/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.02,
            ),
            const Text(
              'Complete Profile',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue\nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
            ),
            const CompleteProfileForm(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const Text(
              'By continuing your confirm that you agree\nwith our Terms and Conditions',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
