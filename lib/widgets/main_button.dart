import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/font.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class MainButton extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;
  final bool mainColor;


  const MainButton({super.key, required this.label,this.mainColor = true, required this.onTap,}); //

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
        padding: const EdgeInsets.symmetric(vertical: kButtonVerticalPadding, horizontal: kVerticalPaddingL),
        decoration: BoxDecoration(
            color: mainColor==true ? kMainColor:kSecondaryColor,
            borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Text(label, style: kButtonStyle, textAlign: TextAlign.center),
      ),
    );
  }
}