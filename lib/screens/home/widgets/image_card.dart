import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/text/hc5/hc5_formatted_title.dart';
import 'package:fampay_cards/global/widgets/text/hc5/hc5_title.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCard extends StatelessWidget {
  final FampayCard card;
  const ImageCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card.url == null ? null : () async => await launch(card.url ?? ''),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CardImage.toImageProvider(card.bgImage),
          ),
          borderRadius: BorderRadius.circular(12.0),
          color: stringToColor(card.bgColor),
          gradient: card.bgGradient!.colors.length >= 2
              ? FampayGradient.toWidget(card.bgGradient)
              : null,
        ),
        margin: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CardImage.toWidget(card.icon),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card.formattedTitle == null
                    ? Hc5Title(text: card.title)
                    : Hc5FormattedTitle(
                        formattedText: card.formattedTitle,
                      ),
                card.formattedDescription == null
                    ? Hc5Title(text: card.description)
                    : Hc5FormattedTitle(
                        formattedText: card.formattedDescription,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
