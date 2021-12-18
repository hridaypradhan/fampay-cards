import 'dart:convert';

import 'package:fampay_cards/models/card.dart';

class CardGroup {
  CardGroup({
    required this.isScrollable,
    required this.name,
    required this.designType,
    required this.height,
    required this.cards,
  });

  bool isScrollable;
  String name, designType;
  int height;
  List<FampayCard> cards;

  factory CardGroup.fromJson(String str) => CardGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardGroup.fromMap(Map<String, dynamic> json) => CardGroup(
        isScrollable: json["is_scrollable"],
        name: json["name"],
        designType: json["design_type"],
        height: json["height"] ?? 50,
        cards: List<FampayCard>.from(
          json["cards"].map(
            (x) => FampayCard.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "is_scrollable": isScrollable,
        "name": name,
        "design_type": designType,
        "height": height,
        "cards": List<dynamic>.from(
          cards.map(
            (x) => x.toMap(),
          ),
        ),
      };
}
