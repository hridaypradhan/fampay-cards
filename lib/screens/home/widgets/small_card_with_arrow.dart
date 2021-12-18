import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/text/hc6/hc6_formatted_title.dart';
import 'package:fampay_cards/global/widgets/text/hc6/hc6_title.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallCardWithArrow extends StatelessWidget {
  final FampayCard card;
  const SmallCardWithArrow({
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
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20.0),
        child: ListTile(
          title: card.formattedTitle == null
              ? Hc6Title(text: card.title)
              : Hc6FormattedTitle(
                  formattedText: card.formattedTitle,
                ),
          subtitle: card.formattedDescription == null
              ? Hc6Title(text: card.description)
              : Hc6FormattedTitle(
                  formattedText: card.formattedDescription,
                ),
          leading: CardImage.toWidget(card.icon),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
