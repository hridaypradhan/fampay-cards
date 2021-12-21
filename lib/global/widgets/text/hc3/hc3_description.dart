import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Hc3Description extends StatelessWidget {
  final String? text;
  const Hc3Description({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
    );
  }
}
