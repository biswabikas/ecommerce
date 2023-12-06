import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/Profile Image.png'),
          ),
          Positioned(
            bottom: 0,
            right: -8,
            child: Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: () {},
                child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
