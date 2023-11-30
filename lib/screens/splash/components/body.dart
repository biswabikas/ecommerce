import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/splash/components/splash_content.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentpage = 0;
  List<Map<String, String>> splashdata = [
    {
      "text": 'Welcome to Tokoto,Let\'s shop',
      'image': 'assets/images/splash_1.png'
    },
    {
      'text': 'We people connect with store \naround United State of America',
      'image': 'assets/images/splash_2.png'
    },
    {
      'text': 'We show the easy way to shop.\nJust stay at home with us',
      'image': 'assets/images/splash_3.png'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                itemCount: splashdata.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashdata[index]['text'],
                  image: splashdata[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashdata.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          SignInScreen.routename,
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      width: currentpage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentpage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
