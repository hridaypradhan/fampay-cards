import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/cta_button.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_formatted_title.dart';
import 'package:fampay_cards/global/widgets/text/hc3/hc3_title.dart';
import 'package:fampay_cards/models/card.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

class _BigDisplayCardState extends State<BigDisplayCard>
    with SingleTickerProviderStateMixin {
  SlidableController? slidableController;

  @override
  void dispose() {
    slidableController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    slidableController = SlidableController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.card.url == null
          ? null
          : () async => await launch(widget.card.url ?? ''),
      onLongPress: () => slidableController?.openStartActionPane(),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: Column(
                children: [
                  Hc3SlidableButton(
                    icon: Icons.notifications,
                    text: 'remind later',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20.0),
                  Hc3SlidableButton(
                    icon: Icons.close,
                    text: 'dismiss now',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        enabled: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CardImage.toImageProvider(widget.card.bgImage),
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: stringToColor(widget.card.bgColor),
            gradient: widget.card.bgGradient!.colors.length >= 2
                ? FampayGradient.toWidget(widget.card.bgGradient)
                : null,
          ),
          height: 350.0,
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CardImage.toWidget(widget.card.icon),
              widget.card.formattedTitle == null
                  ? Hc3Title(text: widget.card.title)
                  : Hc3FormattedTitle(
                      formattedText: widget.card.formattedTitle,
                    ),
              widget.card.formattedDescription == null
                  ? Hc3Title(text: widget.card.description)
                  : Hc3FormattedTitle(
                      formattedText: widget.card.formattedDescription,
                    ),
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
