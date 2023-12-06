import 'package:ecommerce_app/models/product.dart';

class Cart {
  final Product product;
  final int numberofitems;
  Cart({required this.product, required this.numberofitems});
}

List<Cart> democarts = [
  Cart(product: demoProducts[0], numberofitems: 2),
  Cart(product: demoProducts[1], numberofitems: 1),
  Cart(product: demoProducts[3], numberofitems: 2),
];
