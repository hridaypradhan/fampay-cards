import 'package:fampay_cards/global/constants/colors.dart';
import 'package:flutter/material.dart';

class Hc6Title extends StatelessWidget {
  final String? text;
  const Hc6Title({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
    );
  }
}
