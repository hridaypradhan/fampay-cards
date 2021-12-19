import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/models/formatted_text.dart';
import 'package:flutter/material.dart';

class Hc5FormattedDescription extends StatelessWidget {
  final FormattedText? formattedText;
  const Hc5FormattedDescription({
    Key? key,
    required this.formattedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: FormattedText.toWidget(formattedText),
        style: const TextStyle(
          fontSize: 14.74,
          fontWeight: FontWeight.w500,
          color: logoColor,
        ),
      ),
    );
  }
}
