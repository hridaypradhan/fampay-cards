import '../../../constants/colors.dart';
import '../../../../models/formatted_text.dart';
import 'package:flutter/material.dart';

class Hc5FormattedTitle extends StatelessWidget {
  final FormattedText? formattedText;
  const Hc5FormattedTitle({
    Key? key,
    required this.formattedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: FormattedText.toWidget(formattedText),
        style: const TextStyle(
          fontSize: 20.64,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
    );
  }
}
