import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style/colors.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/img/background_1.svg',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      color: kMainColor,
    );
  }
}
