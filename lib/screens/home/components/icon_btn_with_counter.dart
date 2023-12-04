import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgsrc,
    this.numberofitems = 0,
    required this.press,
  });
  final String svgsrc;
  final int numberofitems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(12),
            ),
            width: getProportionateScreenWidth(46),
            height: getProportionateScreenHeight(46),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(svgsrc),
          ),
          if (numberofitems != 0)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    '$numberofitems',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
