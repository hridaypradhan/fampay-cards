import 'package:fampay_cards/global/widgets/text/logo_text.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LogoText(text: 'fampay'),
        Image.asset('assets/logo.png'),
      ],
    );
  }
}
