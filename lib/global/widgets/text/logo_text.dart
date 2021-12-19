import 'package:fampay_cards/global/constants/colors.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final String text;
  const LogoText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: primaryColor,
        fontSize: 19.89,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
