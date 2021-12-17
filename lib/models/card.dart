import 'dart:convert';

import 'package:fampay_cards/models/gradient.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/cta.dart';
import 'package:fampay_cards/models/formatted_text.dart';

class Card {
  Card({
    required this.name,
    this.title,
    this.description,
    this.formattedTitle,
    required this.cta,
    this.formattedDescription,
    this.bgGradient,
    this.icon,
    this.url,
    this.bgImage,
    this.bgColor,
  });

  String name;
  String? title, description, url;
  FormattedText? formattedTitle, formattedDescription;
  List<Cta> cta;
  Gradient? bgGradient;
  CardImage? icon, bgImage;
  int? bgColor;

  factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Card.fromMap(Map<String, dynamic> json) => Card(
        name: json["name"],
        title: json["title"],
        description: json["description"],
        formattedTitle: FormattedText.fromMap(json["formatted_title"]),
        cta: List<Cta>.from(json["cta"].map((x) => Cta.fromMap(x))),
        formattedDescription:
            FormattedText.fromMap(json["formatted_description"]),
        bgGradient: Gradient.fromMap(json["bg_gradient"]),
        icon: CardImage.fromMap(json["icon"]),
        url: json["url"],
        bgImage: CardImage.fromMap(json["bg_image"]),
        bgColor: json["bg_color"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "title": title,
        "description": description,
        "formatted_title": formattedTitle?.toMap(),
        "cta": List<dynamic>.from(cta.map((x) => x.toMap())),
        "formatted_description": formattedDescription?.toMap(),
        "bg_gradient": bgGradient?.toMap(),
        "icon": icon?.toMap(),
        "url": url,
        "bg_image": bgImage?.toMap(),
        "bg_color": bgColor,
      };
}
