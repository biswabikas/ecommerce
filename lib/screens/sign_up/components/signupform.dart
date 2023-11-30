import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce_app/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmpassword;
  final List<String> errors = [];
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
            height: getProportionateScreenWidth(30),
          ),
          BuildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          BuildConfirmPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          FormError(errors: errors),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (formkey.currentState!.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routename);
              }
            },
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField BuildConfirmPasswordFormField() {
    return TextFormField(
      onSaved: (newvalue) => confirmpassword = newvalue,
      onChanged: (value) {
        if (password == confirmpassword) {
          removeerror(error: kMatchPassError);
        } else if (value.length >= 8) {
          removeerror(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != confirmpassword) {
          addError(error: kMatchPassError);
        }
      },
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        hintText: 'Enter your Password',
        labelText: 'Confirm Password',
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
