import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/sign_in/components/body.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Text(
                'Forgot password',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Please enter your email and we will send \n you a link to return to your account ',
                textAlign: TextAlign.center,
              ),
              const ForgotPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  List<String> errors = [];
  String? email;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSuffixIcon(
                svgIcon: 'assets/icons/Mail.svg',
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              enabledBorder: OutlineInputBorder(
                gapPadding: 10,
                borderRadius: BorderRadius.circular(21),
                borderSide: const BorderSide(
                  color: kTextColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 10,
                borderRadius: BorderRadius.circular(21),
                borderSide: const BorderSide(
                  color: kTextColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (formkey.currentState!.validate()) {}
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          const NoAccountText(),
        ],
      ),
    );
  }
}
