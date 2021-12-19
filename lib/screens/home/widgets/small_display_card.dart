import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/custom_list_tile.dart';
import 'package:fampay_cards/global/widgets/text/hc1/hc1_formatted_title.dart';
import 'package:fampay_cards/global/widgets/text/hc1/hc1_title.dart';
import 'package:fampay_cards/models/contextual_card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallDisplayCard extends StatelessWidget {
  final FampayCard card;
  const SmallDisplayCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card.url == null ? null : () async => await launch(card.url ?? ''),
      child: Container(
        decoration: BoxDecoration(
          image: CardImage.toDecorationImage(card.bgImage, 1),
          borderRadius: BorderRadius.circular(12.0),
          color: stringToColor(card.bgColor),
          gradient: card.bgGradient!.colors.length >= 2
              ? FampayGradient.toWidget(card.bgGradient)
              : null,
        ),
        height: 60.0,
        margin: const EdgeInsets.all(10.0),
        child: CustomListTile(
          title: card.formattedTitle == null
              ? Hc1Title(text: card.title)
              : Hc1FormattedTitle(
                  formattedText: card.formattedTitle,
                ),
          subtitle: card.formattedDescription == null
              ? Hc1Title(text: card.description)
              : Hc1FormattedTitle(
                  formattedText: card.formattedDescription,
                ),
          leading: SizedBox(
            child: CardImage.toWidget(card.icon),
            height: 50.0,
          ),
        ),
      ),
    );
  }
}
