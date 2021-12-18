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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cardGroup.cards.length,
          (index) => DesignTypeEnum.toWidget(
            cardGroup.designType,
            cardGroup.cards[index],
            cardGroup.height,
          ),
        ),
      ),
    );
  }
}
