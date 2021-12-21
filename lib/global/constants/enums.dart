import '../../models/contextual_card.dart';
import '../../screens/home/widgets/big_display_card.dart';
import '../../screens/home/widgets/dynamic_width_card.dart';
import '../../screens/home/widgets/image_card.dart';
import '../../screens/home/widgets/small_card_with_arrow.dart';
import '../../screens/home/widgets/small_display_card.dart';
import 'package:flutter/material.dart';

// Enums have been implemented as classes to be able to include relevant methods

class DesignTypeEnum {
  static const hc1 = "HC1";
  static const hc3 = "HC3";
  static const hc5 = "HC5";
  static const hc6 = "HC6";
  static const hc9 = "HC9";

  // One method to get specific cards from the supplied design type
  static Widget toWidget(String designType, FampayCard card, int parentHeight) {
    switch (designType) {
      case hc1:
        return SmallDisplayCard(card: card);
      case hc3:
        return BigDisplayCard(card: card);
      case hc5:
        return ImageCard(card: card);
      case hc6:
        return SmallCardWithArrow(card: card);
      case hc9:
        return DynamicWidthCard(
          card: card,
          parentHeight: parentHeight,
        );
      default:
        return Container();
    }
  }
}

class FontStyleEnum {
  static const underline = 'underline';
  static const italic = 'italic';
  static const bold = 'bold';
  static const strikethrough = 'strikethrough';

  static TextStyle toFontStyle(String? fontStyleGiven) {
    switch (fontStyleGiven) {
      case underline:
        return const TextStyle(decoration: TextDecoration.underline);
      case italic:
        return const TextStyle(fontStyle: FontStyle.italic);
      case bold:
        return const TextStyle(decoration: TextDecoration.underline);
      case strikethrough:
        return const TextStyle(decoration: TextDecoration.underline);
      default:
        return const TextStyle();
    }
  }
}
