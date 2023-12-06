import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedimage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              widget.product.images[selectedimage],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.images.length,
              (index) => buildsmallpreview(index),
            )
          ],
        )
      ],
    );
  }

  GestureDetector buildsmallpreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedimage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          right: getProportionateScreenWidth(15),
        ),
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8),
        ),
        width: getProportionateScreenWidth(48),
        height: getProportionateScreenHeight(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedimage == index ? kPrimaryColor : Colors.transparent,
          ),
        ),
        child: Image.asset(
          widget.product.images[index],
        ),
      ),
    );
  }
}
