import 'dart:convert';

import 'package:fampay_cards/models/gradient.dart';
import 'package:fampay_cards/models/card_image.dart';
import 'package:fampay_cards/models/cta.dart';
import 'package:fampay_cards/models/formatted_text.dart';

class FampayCard {
  FampayCard({
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
  String? title, description, url, bgColor;
  FormattedText? formattedTitle, formattedDescription;
  List<Cta>? cta;
  FampayGradient? bgGradient;
  CardImage? icon, bgImage;

  factory FampayCard.fromJson(String str) =>
      FampayCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FampayCard.fromMap(Map<String, dynamic> json) {
    return FampayCard(
      name: json["name"],
      title: json["title"],
      description: json["description"],
      formattedTitle: FormattedText.fromMap(json["formatted_title"] ?? {}),
      cta: List<Cta>.generate(
          json["cta"]?.length ?? 0, (index) => Cta.fromMap(json["cta"][index])),
      formattedDescription:
          FormattedText.fromMap(json["formatted_description"] ?? {}),
      bgGradient: FampayGradient.fromMap(json["bg_gradient"] ?? {}),
      icon: CardImage.fromMap(json["icon"] ?? {}),
      url: json["url"],
      bgImage: CardImage.fromMap(json["bg_image"] ?? {}),
      bgColor: json["bg_color"],
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "title": title,
        "description": description,
        "formatted_title": formattedTitle?.toMap(),
        "cta": List<dynamic>.from(cta!.map((x) => x.toMap())),
        "formatted_description": formattedDescription?.toMap(),
        "bg_gradient": bgGradient?.toMap(),
        "icon": icon?.toMap(),
        "url": url,
        "bg_image": bgImage?.toMap(),
        "bg_color": bgColor,
      };
}
