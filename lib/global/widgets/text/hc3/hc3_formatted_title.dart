import 'package:fampay_cards/models/formatted_text.dart';
import 'package:flutter/material.dart';

class Hc3FormattedTitle extends StatelessWidget {
  final FormattedText? formattedText;
  const Hc3FormattedTitle({
    Key? key,
    required this.formattedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: FormattedText.toWidget(formattedText),
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
