import 'package:flutter/material.dart';

class Hc1Description extends StatelessWidget {
  final String? text;
  const Hc1Description({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
