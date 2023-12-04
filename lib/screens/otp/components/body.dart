import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              const Text(
                'OTP verfication',
                style: headingStyle,
              ),
              const Text('We sent your code to +91 943792 ****'),
              BuildTimer(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.15,
              ),
              const OtpForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Resend OTP code ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row BuildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This code will expire in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${value.toInt()}',
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    pin4FocusNode!.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.15,
          ),
          DefaultButton(
            text: 'Continue',
            press: () {
              Navigator.pushNamed(context, HomeScreen.routename);
            },
          ),
        ],
      ),
    );
  }
}
