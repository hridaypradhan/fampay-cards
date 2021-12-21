import '../constants/colors.dart';
import '../../models/cta.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CtaButton extends StatelessWidget {
  final Cta cta;
  const CtaButton({
    Key? key,
    required this.cta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await launch(cta.url ?? '');
      },
      style: ElevatedButton.styleFrom(
        primary: stringToColor(cta.bgColor),
      ),
      child: Text(cta.text),
    );
  }
}
