import 'package:fampay_cards/global/constants/colors.dart';
import 'package:flutter/material.dart';

class Hc5Title extends StatelessWidget {
  final String? text;
  const Hc5Title({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 20.64,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
    );
  }
}
