import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return GestureDetector(
      onTap: card.url == null ? null : () async => await launch(card.url ?? ''),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Opacity(
          opacity: 0,
          child: toWidget(card.bgImage),
        ),
        height: height.toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: stringToColor(card.bgColor),
          gradient: card.bgGradient!.colors.length >= 2
              ? FampayGradient.toWidget(card.bgGradient)
              : null,
        ),
      ),
    );
  }

  static Image toWidget(CardImage? cardImage) {
    if (cardImage?.imageType == 'ass' || cardImage?.imageType == 'asset') {
      return Image(
        fit: BoxFit.fitHeight,
        image: AssetImage(cardImage?.assetType ?? 'c'),
        errorBuilder: (context, object, stackTrace) => Container(),
      );
    } else {
      return Image(
        fit: BoxFit.fitHeight,
        image: NetworkImage(cardImage?.imageUrl ?? 'c'),
        errorBuilder: (context, object, stackTrace) => Container(),
      );
    }
  }
}
