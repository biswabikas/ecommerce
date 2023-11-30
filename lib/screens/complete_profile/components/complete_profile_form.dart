import 'package:ecommerce_app/components/default_button.dart';
import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final formkey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? address;
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeerror({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            BuildFistNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            BuildLastNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            BuildPhoneNumberFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            BuildAdressFormField(),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pushNamed(context, OtpScreen.routename);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  TextFormField BuildAdressFormField() {
    return TextFormField(
      onSaved: (newvalue) => address = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeerror(error: kAddressNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/Location point.svg',
        ),
        hintText: 'Enter your Address',
        labelText: 'Address',
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

  TextFormField BuildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newvalue) => phonenumber = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeerror(error: kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/Phone.svg',
        ),
        hintText: 'Enter your Phone Number',
        labelText: 'Phone Number',
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

  TextFormField BuildLastNameFormField() {
    return TextFormField(
      onSaved: (newvalue) => lastname = newvalue,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
        hintText: 'Enter your last name',
        labelText: 'Last Name',
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

  TextFormField BuildFistNameFormField() {
    return TextFormField(
      onSaved: (newvalue) => firstname = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeerror(error: kNamelNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const CustomSuffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
        hintText: 'Enter your first name',
        labelText: 'First Name',
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
