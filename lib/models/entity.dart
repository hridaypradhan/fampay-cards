import 'dart:convert';

import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/constants/enums.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Entity {
  Entity({
    required this.text,
    this.color,
    this.url,
    this.fontStyle,
  });

  String text;
  String? color, url, fontStyle;

  factory Entity.fromJson(String str) => Entity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Entity.fromMap(Map<String, dynamic> json) => Entity(
        text: json["text"],
        color: json["color"],
        url: json["url"],
        fontStyle: json["fontStyle"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "color": color,
        "url": url,
        "font_style": fontStyle,
      };

  static TextSpan formatText(String text, Entity entity) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()
        ..onTap = () async =>
            entity.url == null ? null : await launch(entity.url ?? ''),
      style: FontStyleEnum.toFontStyle(entity.fontStyle).copyWith(
        color: stringToColor(entity.color),
      ),
    );
  }
}
