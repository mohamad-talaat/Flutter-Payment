import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFEDEDED),
      radius: 50,
      child: CircleAvatar(
        backgroundColor: Color(0xFF34A853),
        radius: 40,
        child: SvgPicture.asset(
          'assets/images/check_icon.svg',
        ),
      ),
    );
  }
}
