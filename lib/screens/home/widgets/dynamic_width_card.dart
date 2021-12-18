import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';

class DynamicWidthCard extends StatelessWidget {
  final FampayCard card;
  final int height;
  const DynamicWidthCard({
    Key? key,
    required this.card,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(''),
      height: height.toDouble(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CardImage.toImageProvider(card.bgImage),
          opacity: 0,
        ),
        borderRadius: BorderRadius.circular(12.0),
        color: stringToColor(card.bgColor),
        gradient: card.bgGradient!.colors.length >= 2
              ? FampayGradient.toWidget(card.bgGradient)
              : null,
      ),
    );
  }
}
