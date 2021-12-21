import '../../../global/constants/colors.dart';
import '../../../models/contextual_card.dart';
import '../../../models/card_image.dart';
import '../../../models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicWidthCard extends StatelessWidget {
  final FampayCard card;
  final int parentHeight;

  const DynamicWidthCard({
    Key? key,
    required this.card,
    required this.parentHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card.url == null ? null : () async => await launch(card.url ?? ''),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        // This widget does not display its image but takes the image's height => opacity = 0
        child: Opacity(
          opacity: 0,
          child: toWidget(card.bgImage),
        ),
        height: parentHeight.toDouble(),
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

  // Overridden method that makes the returned image force its height on its parent
  static Image toWidget(CardImage? cardImage) {
    if (cardImage?.imageType == 'ass' || cardImage?.imageType == 'asset') {
      return Image(
        fit: BoxFit.fitHeight,
        image: AssetImage(cardImage?.assetType ?? ''),
        errorBuilder: (context, object, stackTrace) => Container(),
      );
    } else {
      return Image(
        fit: BoxFit.fitHeight,
        image: NetworkImage(cardImage?.imageUrl ?? ''),
        errorBuilder: (context, object, stackTrace) => Container(),
      );
    }
  }
}
