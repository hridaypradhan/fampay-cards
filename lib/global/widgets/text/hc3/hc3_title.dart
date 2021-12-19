import 'package:fampay_cards/global/constants/colors.dart';
import 'package:flutter/material.dart';

class Hc3Title extends StatelessWidget {
  final String? text;
  const Hc3Title({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
        color: logoColor,
      ),
    );
  }
}
