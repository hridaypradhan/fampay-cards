import 'dart:convert';

import 'entity.dart';
import 'package:flutter/material.dart';

class FormattedText {
  FormattedText({
    required this.text,
    required this.entities,
  });

  String text;
  List<Entity> entities;

  factory FormattedText.fromJson(String str) =>
      FormattedText.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormattedText.fromMap(Map<String, dynamic> json) => FormattedText(
        text: json["text"] ?? '',
        entities: List<Entity>.from(
            json["entities"] ?? [].map((x) => Entity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "entities": List<dynamic>.from(entities.map((x) => x.toMap())),
      };

  // Generate list of formatted tokens from the given string
  static List<InlineSpan> toWidget(FormattedText? formattedText) {
    var children = <InlineSpan>[];
    int entityIndex = 0;
    var tokens = formattedText?.text.split(' ');

    if (tokens != null) {
      for (String token in tokens) {
        if (token != '{}') {
          children.add(TextSpan(text: token + ' '));
        } else {
          children.add(
            Entity.formatText(
              token + ' ',
              formattedText!.entities[entityIndex],
            ),
          );
          entityIndex++;
        }
      }
    }

    return children;
  }
}
