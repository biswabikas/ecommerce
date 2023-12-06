import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/components/social_card.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/forgot_password/forgot_password_screem.dart';
import 'package:ecommerce_app/screens/log_in_success/login_success_screen.dart';
import 'package:ecommerce_app/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.04,
                ),
                Text(
                  'Welcome back',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sign in with your email and password \nor continue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.08,
                ),
                const SignForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final formkey = GlobalKey<FormState>();
  List<String> errors = [];
  String? password;
  String? email;
  bool remember = false;
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeerror({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          BuildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          BuildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              const Text('Remember me'),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routename);
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState?.save();
                Navigator.pushNamed(context, LogInSuccessScreen.routename);
              }
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
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
              SocialCard(icon: 'assets/icons/google-icon.svg', press: () {}),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              SocialCard(icon: 'assets/icons/twitter.svg', press: () {}),
            ],
          ),
          const NoAccountText()
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField BuildPasswordFormField() {
    return TextFormField(
      onSaved: (newvalue) => password = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          errors.remove(kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          errors.add(kShortPassError);
        }
      },
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        hintText: 'Enter your Password',
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: kTextColor,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(
              color: kTextColor,
            ),
            gapPadding: 10),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField BuildEmailFormField() {
    return TextFormField(
      onSaved: (newvalue) => email = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          errors.remove(kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          errors.add(kInvalidEmailError);
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
        hintText: 'Enter your email',
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: kTextColor,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(
              color: kTextColor,
            ),
            gapPadding: 10),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont\'t have an account?',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routename);
          },
          child: Text(
            'Sign up',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
