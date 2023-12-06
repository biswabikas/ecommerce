import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    required this.pressonseemore,
  });

  final Product product;
  final GestureTapCallback pressonseemore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(15),
            ),
            width: getProportionateScreenWidth(64),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            // ignore: deprecated_member_use
            child: SvgPicture.asset(
              'assets/icons/Heart Icon_2.svg',
              color: product.isFavourite
                  ? const Color(0xFFFF4848)
                  : const Color(0xFFF5F6F9),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(20),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: pressonseemore,
            child: const Row(
              children: [
                Text(
                  'See More Details',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                  size: 12,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
