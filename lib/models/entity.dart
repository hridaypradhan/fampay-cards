import 'dart:convert';

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
}
