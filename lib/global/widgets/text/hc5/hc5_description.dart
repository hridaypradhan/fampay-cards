import 'package:fampay_cards/global/constants/colors.dart';
import 'package:flutter/material.dart';

class Hc5Description extends StatelessWidget {
  final String? text;
  const Hc5Description({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 14.74,
        fontWeight: FontWeight.w500,
        color: logoColor,
      ),
    );
  }
}
