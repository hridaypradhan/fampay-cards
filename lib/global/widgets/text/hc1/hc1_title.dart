import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

class Hc1Title extends StatelessWidget {
  final String? text;
  const Hc1Title({
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
