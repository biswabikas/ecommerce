import 'package:ecommerce_app/screens/home/components/section_title.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Special for you',
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                category: 'Smartphone',
                image: 'assets/images/Image Banner 2.png',
                numberofbrands: 18,
                press: () {},
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SpecialOfferCard(
                category: 'Fashion',
                image: 'assets/images/Image Banner 3.png',
                numberofbrands: 24,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numberofbrands,
    required this.press,
  });
  final String category, image;
  final int numberofbrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(18),
        ),
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenHeight(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: '$category\n',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: '$numberofbrands brands'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
