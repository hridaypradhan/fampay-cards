import '../../../constants/colors.dart';
import '../../../../models/formatted_text.dart';
import 'package:flutter/material.dart';

class Hc1FormattedDescription extends StatelessWidget {
  final FormattedText? formattedText;
  const Hc1FormattedDescription({
    Key? key,
    required this.formattedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: FormattedText.toWidget(formattedText),
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ),
      ),
    );
  }
}
