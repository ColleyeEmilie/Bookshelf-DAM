import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/font.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.label, required this.onTap});
  final String label;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: MediaQuery.of(context).size.width/2.5,
        padding: const EdgeInsets.symmetric(vertical: kButtonVerticalPadding/2, horizontal: kVerticalPaddingS),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(kBorderRadius/2),
        ),
        child: Align(
          alignment: Alignment.center,
            child: Text(label, style: kButtonStyle)
        ),
      ),
    );
  }
}
