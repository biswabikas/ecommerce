import 'package:ecommerce_app/screens/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [],
          ),
        )
      ],
    );
  }
}
