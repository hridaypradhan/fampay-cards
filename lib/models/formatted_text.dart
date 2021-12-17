import 'dart:convert';

import 'package:fampay_cards/models/entity.dart';

class FormattedText {
    FormattedText({
        required this.text,
        required this.entities,
    });

    String text;
    List<Entity> entities;

    factory FormattedText.fromJson(String str) => FormattedText.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FormattedText.fromMap(Map<String, dynamic> json) => FormattedText(
        text: json["text"],
        entities: List<Entity>.from(json["entities"].map((x) => Entity.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "entities": List<dynamic>.from(entities.map((x) => x.toMap())),
    };
}