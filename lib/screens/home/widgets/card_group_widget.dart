import 'package:fampay_cards/global/constants/enums.dart';
import 'package:fampay_cards/models/card_group.dart';
import 'package:flutter/material.dart';

class CardGroupWidget extends StatelessWidget {
  final CardGroup cardGroup;
  const CardGroupWidget({
    Key? key,
    required this.cardGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardRow = Row(
      children: List.generate(
        cardGroup.cards.length,
        (index) => DesignTypeEnum.toWidget(
          cardGroup.designType,
          cardGroup.cards[index],
          cardGroup.height,
        ),
      ),
    );
    if (cardGroup.designType != DesignTypeEnum.hc9 &&
        cardGroup.cards.length > 1 &&
        cardGroup.isScrollable) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: cardRow,
      );
    } else {
      return cardRow;
    }
  }
}
