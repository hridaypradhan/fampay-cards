import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/cta_button.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_description.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_formatted_description.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_formatted_title.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_title.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BigDisplayCard extends StatelessWidget {
  final FampayCard card;
  const BigDisplayCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap:
            card.url == null ? null : () async => await launch(card.url ?? ''),
        onLongPress: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            image: CardImage.toDecorationImage(card.bgImage, 1),
            borderRadius: BorderRadius.circular(12.0),
            color: stringToColor(card.bgColor),
            gradient: card.bgGradient!.colors.length >= 2
                ? FampayGradient.toWidget(card.bgGradient)
                : null,
          ),
          height: 350.0,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              card.formattedTitle == null
                  ? Hc3Title(text: card.title)
                  : Hc3FormattedTitle(
                      formattedText: card.formattedTitle,
                    ),
              const SizedBox(height: 10.0),
              card.formattedDescription == null
                  ? Hc3Description(text: card.description)
                  : Hc3FormattedDescription(
                      formattedText: card.formattedDescription,
                    ),
              const SizedBox(height: 30.0),
              Row(
                children: List.generate(
                  card.cta!.length,
                  (index) => CtaButton(cta: card.cta![index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hc3SlidableButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  const Hc3SlidableButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: homeBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: hc3IconColor,
            ),
            const SizedBox(height: 15.0),
            Text(text),
          ],
        ),
      ),
    );
  }
}
