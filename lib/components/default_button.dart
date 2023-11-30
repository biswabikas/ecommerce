import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    this.press,
    this.text,
    super.key,
  });
  final void Function()? press;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        onPressed: press!,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}
