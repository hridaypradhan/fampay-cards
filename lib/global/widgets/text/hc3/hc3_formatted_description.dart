import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/models/formatted_text.dart';
import 'package:flutter/material.dart';

class Hc3FormattedDescription extends StatelessWidget {
  final FormattedText? formattedText;
  const Hc3FormattedDescription({
    Key? key,
    required this.formattedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: FormattedText.toWidget(formattedText),
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: logoColor,
        ),
      ),
    );
  }
}
