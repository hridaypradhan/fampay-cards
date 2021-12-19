import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/cta_button.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_description.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_formatted_description.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_formatted_title.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_title.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:fampay_cards/providers/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BigDisplayCard extends StatefulWidget {
  final FampayCard card;
  const BigDisplayCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<BigDisplayCard> createState() => _BigDisplayCardState();
}

class _BigDisplayCardState extends State<BigDisplayCard> {
  ScrollController scrollController = ScrollController();
  bool isEnd = true;

  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<CardProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.95,
      child: SingleChildScrollView(
        reverse: true,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Column(
              children: [
                Hc3SlidableButton(
                  icon: Icons.notifications,
                  text: 'remind me',
                  onPressed: () {
                    cardProvider.temporaryRemoval(widget.card);
                  },
                ),
                Hc3SlidableButton(
                  icon: Icons.close,
                  text: 'dismiss now',
                  onPressed: () {
                    cardProvider.permanentRemoval(widget.card);
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: widget.card.url == null
                  ? null
                  : () async => await launch(widget.card.url ?? ''),
              onLongPress: () {
                scrollController.animateTo(
                  isEnd
                      ? scrollController.position.minScrollExtent
                      : scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.decelerate,
                );
                isEnd = !isEnd;
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  image: CardImage.toDecorationImage(widget.card.bgImage, 1),
                  borderRadius: BorderRadius.circular(12.0),
                  color: stringToColor(widget.card.bgColor),
                  gradient: widget.card.bgGradient!.colors.length >= 2
                      ? FampayGradient.toWidget(widget.card.bgGradient)
                      : null,
                ),
                height: 350.0,
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.card.formattedTitle == null
                        ? Hc3Title(text: widget.card.title)
                        : Hc3FormattedTitle(
                            formattedText: widget.card.formattedTitle,
                          ),
                    const SizedBox(height: 10.0),
                    widget.card.formattedDescription == null
                        ? Hc3Description(text: widget.card.description)
                        : Hc3FormattedDescription(
                            formattedText: widget.card.formattedDescription,
                          ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: List.generate(
                        widget.card.cta!.length,
                        (index) => CtaButton(cta: widget.card.cta![index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
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
