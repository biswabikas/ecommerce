import 'package:ecommerce_app/components/rounded_icon_btn.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  static String routename = './details';
  const DetailsScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // /    backgroundColor: const Color(0xFFF5F6F9),
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: RoundedIconButton(
          icondata: Icons.arrow_back_ios,
          press: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 8),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    '${product.rating}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset('assets/icons/Star Icon.svg'),
                ],
              ),
            ),
          )
        ],
      ),
      body: Body(product: product),
    );
  }
}
