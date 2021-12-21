import '../../../global/constants/enums.dart';
import '../../../models/card_group.dart';
import 'package:flutter/material.dart';

class CardGroupWidget extends StatelessWidget {
  final CardGroup cardGroup;

  const CardGroupWidget({
    Key? key,
    required this.cardGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardsRow = Row(
      children: List.generate(
        cardGroup.cards.length,
        (index) => DesignTypeEnum.toWidget(
          cardGroup.designType,
          cardGroup.cards[index],
          cardGroup.height,
        ),
      ),
    );

    /*
      Return a scrollable row unless 
      - Design type is HC9
      - There is only one card
      - The 'is_scrollable' property is false
    */
    if (cardGroup.designType != DesignTypeEnum.hc9 &&
        cardGroup.cards.length > 1 &&
        cardGroup.isScrollable) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: cardsRow,
      );
    } else {
      return cardsRow;
    }
  }
}
